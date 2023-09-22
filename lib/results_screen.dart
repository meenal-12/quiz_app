import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start-screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required this.choosenAnswers,required this.restart});
  final List<String> choosenAnswers;
  final void Function() restart;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for(var i=0;i<choosenAnswers.length;i++){
       summary.add({
         'question_index':i,
         'question':questions[i].text,
         'correct_answer':questions[i].answers[0],
         'user_answer':choosenAnswers[i]
       });
    }
    return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final totalquestions = questions.length;
    final correctanswers = summarydata.where((data){
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             'You answered $correctanswers out of $totalquestions questions correctly',
            textAlign: TextAlign.center,
            style: TextStyle(

              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,

            ),),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: restart,
              child:const Text('ReStart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
