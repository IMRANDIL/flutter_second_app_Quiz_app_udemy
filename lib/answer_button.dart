import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.tap, {super.key});

  final String text;
  final void Function() tap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: tap,
      child: Text(
        text,
        style: const TextStyle(),
      ),
    );
  }
}
