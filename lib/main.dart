import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/photo_list_screen.dart';
import 'providers/photo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhotoProvider()..fetchPhotos()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Gallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PhotoListScreen(),
      ),
    );
  }
}
