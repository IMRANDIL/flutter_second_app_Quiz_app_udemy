import 'package:flutter/material.dart';
import 'package:flutter_second_app/data/questions.dart';
import 'package:flutter_second_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.restart, required this.choosenAnswers});
  final void Function() restart;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryList() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'current_question': questions[i].question,
          'current_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final getSummaryData = getSummaryList();
    final totalNumberOfQuestions = questions.length;
    final totalCorrectNumberOfQuestions = getSummaryData.where((data) {
      return data['user_answer'] == data['current_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $totalCorrectNumberOfQuestions out of $totalNumberOfQuestions questions correctly!',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              getSummaryList(),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: restart, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
