import 'package:flutter/material.dart';

import '../Model/question.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question('Pakistan Resolution was not passed at Minto Park.', false),
    Question(
      'Quaid-e-Azam was born on 25th December 1878',
      false,
    ),
    Question(
      'Pakistan doesn\'t have a capital.',
      false,
    ),
    Question(
      'In 1971 East Pakistan decided to seek independence and took the name Bangladesh.',
      true,
    ),
    Question(
      'The word Pakistan means the Land of five rivers.',
      false,
    ),
    Question(
      'Muhammad Ali Jinnah was the first Governor General of Pakistan.',
      true,
    ),
    Question(
      'Pakistan won Olympic gold medal in Hockey for the first time in 1962.',
      false,
    ),
    Question(
      'Jasmine is the national flower of Pakistan.',
      true,
    ),
    Question(
      'Fatima Jinnah designed Pakistan’s national flag.',
      false,
    ),
    Question(
      'English is not the national language of Pakistan.',
      true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: _appBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/flag.png',
                width: 250,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(
                    color: Colors.blueGrey.shade400,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(questionBank[_currentQuestionIndex].questionText, style: TextStyle(
                    fontSize: 16.9,
                    color: Colors.white,
                  ),),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _checkAnswer(userChoice: true, context: context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  child: Text('TRUE'),),
                ElevatedButton(
                  onPressed: () => _checkAnswer(userChoice: false, context: context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  child: Text('FALSE'),),
                ElevatedButton(
                  onPressed: () => _nextQuestion(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  child: Icon(Icons.arrow_forward,color: Colors.white,)),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
  _checkAnswer({required bool userChoice, required BuildContext context}){
    if(userChoice==questionBank[_currentQuestionIndex].isCorrect){
      final snackbar = SnackBar(
           duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
          content: Text('Correct!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint('Yes Correct!');
      _nextQuestion();
    }else{
      debugPrint('Incorrect!');
      final snackbar = SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          content: Text('Incorrect!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _nextQuestion();
    }
  }
  _nextQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}

_appBar() {
  return AppBar(
    backgroundColor: Colors.blueGrey,
    centerTitle: true,
    title: const Text('True Citizen'),
  );
}
