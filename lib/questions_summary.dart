import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive dimensions based on screen size
    final containerWidth = screenWidth * 0.8;
    final containerHeight = screenHeight * 0.5;
    final rowWidth = screenWidth * 0.9;

    return SizedBox(
      height: containerHeight,
      // color: Colors.green,
      width: containerWidth,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: Colors.red,
                ),
                width: rowWidth,
                height: containerWidth * 0.3,
                padding: EdgeInsets.all(rowWidth * 0.03),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ((data['question_index'] as int) + 1).toString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
