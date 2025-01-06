import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/photo_provider.dart';
import '../widgets/photo_card.dart';

class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: photoProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: photoProvider.photos.length,
              itemBuilder: (context, index) {
                return PhotoCard(photo: photoProvider.photos[index]);
              },
            ),
    );
  }
}
