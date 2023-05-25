import 'package:flutter/material.dart';
import 'package:flutter_second_app/QuestionsScreen.dart';
import 'package:flutter_second_app/ResultsScreen.dart';
import 'package:flutter_second_app/StartScreen.dart';
import 'package:flutter_second_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = 'start-screen';
  List<String> choosenAnswers = [];
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void setTheChoosenAnswer(String answer) {
    choosenAnswers.add(answer);
    if (choosenAnswers.length == questions.length) {
      setState(() {
        choosenAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onChoose: setTheChoosenAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: choosenAnswers,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(207, 37, 28, 52),
                    Color.fromARGB(255, 62, 53, 77)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: screenWidget),
        ),
      ),
    );
  }
}
