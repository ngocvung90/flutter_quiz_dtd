import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rung Chuông Vàng Quiz',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;

  void _answer(bool correct) {
    if (correct) _score++;
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= questions.length) {
      return Scaffold(
        body: Center(
          child: Text('Game Over! Score: \$_score',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    }

    final question = questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Question \${_currentIndex + 1}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(question['question'], style: TextStyle(fontSize: 20)),
            ...List.generate(4, (index) {
              return ElevatedButton(
                onPressed: () => _answer(question['answer'] == index),
                child: Text(question['options'][index]),
              );
            }),
          ],
        ),
      ),
    );
  }
}
