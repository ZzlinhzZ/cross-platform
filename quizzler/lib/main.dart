import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: QuizPage(),
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
  int point = 0;
  List<Question> questionBank = [
    Question(
        questionText: 'Trái Đất là hành tinh thứ ba tính từ Mặt Trời.',
        answer: true),
    Question(
        questionText: 'Con mèo có thể thấy màu đỏ và xanh.', answer: false),
    Question(
        questionText: 'Cá voi là loài động vật có vú lớn nhất trên hành tinh.',
        answer: true),
    Question(
        questionText: "Núi Everest là ngọn núi cao nhất thế giới.",
        answer: true)
  ];

  int questionIndex = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBank[questionIndex].answer;
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        point++;
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      if (questionIndex < questionBank.length - 1) {
        questionIndex++;
      } else {
        Alert(
          context: context,
          title: 'Finished! You are correct $point times.',
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                  scoreKeeper = [];
                });
                Navigator.pop(context);
              },
              width: 120,
              child: Text(
                'RESTART',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        point = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionBank[questionIndex].questionText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => checkAnswer(true),
              child: Text(
                'True',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => checkAnswer(false),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

class Question {
  String questionText;
  bool answer;

  Question({required this.questionText, required this.answer});
}
