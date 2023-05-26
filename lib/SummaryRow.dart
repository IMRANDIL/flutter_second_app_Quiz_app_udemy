import 'package:flutter/material.dart';

class SummaryRow extends StatefulWidget {
  const SummaryRow({
    Key? key,
    required this.data,
    required this.rowWidth,
    required this.containerHeight,
  }) : super(key: key);

  final Map<String, Object> data;
  final double rowWidth;
  final double containerHeight;

  @override
  State<SummaryRow> createState() => _SummaryRowState();
}

class _SummaryRowState extends State<SummaryRow> {
  late bool isAnsweredCorrectly;

  @override
  void initState() {
    super.initState();
    isAnsweredCorrectly =
        widget.data['user_answer'] == widget.data['current_answer'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: Colors.white,
      ),
      width: widget.rowWidth,
      height: widget.containerHeight * 0.7,
      padding: EdgeInsets.all(widget.rowWidth * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isAnsweredCorrectly ? Colors.green : Colors.red,
            ),
            child: Text(
              ((widget.data['question_index'] as int) + 1).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.rowWidth * 0.06,
              ),
              height: widget.containerHeight * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.data['current_question'] as String,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      widget.data['user_answer'] as String,
                      style: TextStyle(
                        fontSize: 25,
                        backgroundColor:
                            isAnsweredCorrectly ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    widget.data['current_answer'] as String,
                    style: const TextStyle(
                      fontSize: 25,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
