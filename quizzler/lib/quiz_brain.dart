import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs',
        questionAnswer: false),
    Question(
        questionText:
            'Approximately one quarter fo human bones are in the feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green', questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
