import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class PhotoProvider with ChangeNotifier {
  List<Photo> _photos = [];
  bool _isLoading = false;

  List<Photo> get photos => _photos;
  bool get isLoading => _isLoading;

  Future<void> fetchPhotos() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _photos = data.map((item) => Photo.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
