import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          'Black', 'Red', 'Green', 'White'
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          'Cat', 'Dog', 'Fish', 'Girrafe'
        ]
      },
      {
        'questionText': 'What\'s your favorite team?',
        'answers': [
          'ManUtd', 'Chelsea', 'Liverpool', 'ManCity'
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),

            ...(questions[_questionIndex]['answers'] as List<String>).map( (answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
