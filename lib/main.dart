import 'package:flutter/material.dart';
import 'package:wallpaper/controller/apiOper.dart';
import 'package:wallpaper/views/screens/category.dart';
import 'package:wallpaper/views/screens/home.dart';
import 'package:wallpaper/views/screens/splashScreen.dart';

import 'demo/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Guru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}