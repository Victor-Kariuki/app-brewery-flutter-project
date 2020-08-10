import 'package:flutter/material.dart';

import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon buildScoreIcon({IconData scoreIcon, Color scoreColor}) =>
      Icon(scoreIcon, color: scoreColor);

  List<Icon> scoreKeeper = [];

  Icon scoreKeeperIcon;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        print('you got it right');
        scoreKeeperIcon =
            buildScoreIcon(scoreIcon: Icons.check, scoreColor: Colors.green);
        scoreKeeper.add(scoreKeeperIcon);
      } else {
        print('you got it wrong');
        scoreKeeperIcon =
            buildScoreIcon(scoreIcon: Icons.close, scoreColor: Colors.red);
        scoreKeeper.add(scoreKeeperIcon);
      }
      quizBrain.nextQuestion();
    });
  }

  QuizBrain quizBrain = new QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                "True",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                "False",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreKeeper,
        ),
      ],
    );
  }
}
