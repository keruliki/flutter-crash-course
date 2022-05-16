import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 20},
        {'text': 'White', 'score': 15}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text':'Cat', 'score': 5}, 
        {'text': 'Dog', 'score': 10},
        {'text': 'Fish', 'score': 15},
        {'text': 'Girrafe', 'score': 20}
        ]
    },
    {
      'questionText': 'What\'s your favorite team?',
      'answers': [
        {'text': 'ManUtd', 'score': 30},
        {'text': 'Chelsea', 'score': 20},
        {'text': 'Liverpool', 'score': 10},
        {'text': 'ManCity', 'score': 5}
        ]
    },
  ];

  var _questionIndex = 0;
  var moreQuestions = true;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    if (_questionIndex < _questions.length) {
      moreQuestions = true;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });

      print('Answer chosen!');
    } else {
      moreQuestions = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
