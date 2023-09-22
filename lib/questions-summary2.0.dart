import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  List<Map<String, Object>> summaryData;

  QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool answeredCorrectly =
                (data['user_answer'] as String) == (data['correct_answer'] as String);
            return Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: answeredCorrectly ? Colors.green : Colors.transparent,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Adjust text color
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your Answer: ${data['user_answer'] as String}',
                        style: TextStyle(
                          color: answeredCorrectly ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        'Correct Answer: ${data['correct_answer'] as String}',
                        style: TextStyle(
                          color: answeredCorrectly ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
