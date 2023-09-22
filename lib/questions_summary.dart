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
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: answeredCorrectly ? Colors.green : Colors.orange,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['question'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your Answer: ${data['user_answer'] as String}',
                            style: TextStyle(
                              color: answeredCorrectly ? Colors.green : Colors.pink
                            ),
                          ),
                          Text(
                            'Correct Answer: ${data['correct_answer'] as String}',
                            style: TextStyle(
                              color: answeredCorrectly ? Colors.green : Colors.black,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Add spacing after each row
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
