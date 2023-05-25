import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered X out of Y questions correctly!',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text('List of answers and questions'),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
