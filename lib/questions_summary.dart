import 'package:flutter/material.dart';
import 'package:flutter_second_app/SummaryRow.dart';

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
      width: containerWidth,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryRow(
                data: data,
                rowWidth: rowWidth,
                containerHeight: containerHeight,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
