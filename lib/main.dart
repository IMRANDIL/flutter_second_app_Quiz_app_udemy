import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 113, 103, 103),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Image.asset(
                'assets/flutter.gif',
                width: constraints.maxWidth * 0.4, // Adjust the width as needed
              );
            },
          ),
        ),
      ),
    ),
  );
}
