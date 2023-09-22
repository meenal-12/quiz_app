import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start-screen.dart';
import 'package:quiz_app/data/questions.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> SelectedAnswers = [];
  String activeScreen = "";

  @override
  void initState() {
    // activeScreen = StartScreen(switchScreen);
    activeScreen = 'start-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      // activeScreen = QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }
  void restartquiz(){

     setState(() {
       SelectedAnswers = [];
       activeScreen = 'questions-screen';
     });
  }

  void chooseAnswer(String answer) {
    SelectedAnswers.add(answer);
    if (SelectedAnswers.length == questions.length) {
      setState(() {
        // SelectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
   Widget activated = StartScreen(switchScreen);
    // if(activeScreen == 'start-screen'){
    //   activated = StartScreen(switchScreen);
    // }
    if (activeScreen == 'questions-screen') {
      activated = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      activated = ResultsScreen(choosenAnswers: SelectedAnswers,restart: restartquiz,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 248, 60, 60),
                Color.fromARGB(255, 241, 209, 221),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activated

            // child: activated,
            ),
      ),
    );
  }
}
