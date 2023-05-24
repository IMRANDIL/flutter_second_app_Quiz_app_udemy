import 'package:flutter/material.dart';
import 'package:flutter_second_app/answer_button.dart';
import 'package:flutter_second_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            questions[0].question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...questions[0].answers.map((answer) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
              child: AnswerButton(answer, () {}),
            );
          }),
        ],
      ),
    );
  }
}
