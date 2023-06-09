import 'package:flutter/material.dart';
import 'package:flutter_second_app/answer_button.dart';
import 'package:flutter_second_app/data/questions.dart';
import 'package:flutter_second_app/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key, required this.onChoose}) : super(key: key);
  final void Function(String answer) onChoose;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentIndex = 0;

  void changeQuestion(String answer) {
    widget.onChoose(answer);
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> answerButtons = [];
    if (currentIndex < questions.length) {
      answerButtons = QuizQuestion(
              questions[currentIndex].question, questions[currentIndex].answers)
          .getShuffledList()
          .map((answer) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: AnswerButton(
            answerText: answer,
            onTap: () {
              changeQuestion(answer);
            },
          ),
        );
      }).toList();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
            child: Text(
              questions[currentIndex].question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                height: 1.5,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...answerButtons,
        ],
      ),
    );
  }
}
