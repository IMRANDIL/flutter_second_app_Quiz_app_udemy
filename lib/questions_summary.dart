import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ((data['question_index'] as int) + 1).toString(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(data['current_question'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data['user_answer'] as String),
                    Text(data['current_answer'] as String),
                  ],
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }
}
