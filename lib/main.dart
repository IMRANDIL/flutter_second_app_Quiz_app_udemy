import 'package:flutter/material.dart';
import 'package:flutter_second_app/StartScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: StartScreen()),
    ),
  );
}
