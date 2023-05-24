import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 139, 81, 81),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
      ),
      child: Text(
        answerText,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
