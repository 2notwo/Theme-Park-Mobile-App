import 'package:flutter/material.dart';

class FunScreen extends StatefulWidget {
  @override
  _FunScreenState createState() => _FunScreenState();
}

class _FunScreenState extends State<FunScreen> {
  int currentQuestionIndex = 0;
  bool showAnswerResult = false;
  int score = 0; // Initialize score

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = rollercoasterTrivia[currentQuestionIndex];
    List<String> options = currentQuestion.options;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rollercoaster Trivia',
          style: TextStyle(color: Colors.white), // Text color: white
        ),
        backgroundColor: Colors.blue, // App bar color: blue
      ),
      body: Container(
        color: Colors.blue[100], // Light blue background color
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.questionText,
              style: TextStyle(
                  fontSize: 18, color: Colors.black), // Text color: black
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Column(
              children: options.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (index == currentQuestion.correctAnswerIndex) {
                        score++; // Increment score if correct answer
                      }
                      showAnswerResult = true;
                    });
                  },
                  child: Text(
                    option,
                    style: TextStyle(color: Colors.white), // Text color: white
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.blue), // Button color: blue
                  ),
                );
              }).toList(),
            ),
            if (showAnswerResult)
              Text(
                'Correct answer is ${options[currentQuestion.correctAnswerIndex]}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color: black
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentQuestionIndex == rollercoasterTrivia.length - 1) {
                    // If last question, show total score
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Quiz Complete'),
                          content: Text('Your total score is $score'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                resetQuiz();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Move to next question
                    showAnswerResult = false;
                    currentQuestionIndex++;
                  }
                });
              },
              child: Text(
                'Next Question',
                style: TextStyle(color: Colors.white), // Text color: white
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.blue), // Button color: blue
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

List<Question> rollercoasterTrivia = [
  Question(
    questionText: 'Which rollercoaster is the tallest in the park?',
    options: ['Looping Star', 'Big Drop', 'Twisted Fury', 'Sky Scream'],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: 'How many inversions does the Looping Star have?',
    options: ['1', '2', '3', '4'],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: 'What is the top speed of Big Drop?',
    options: ['80 mph', '100 mph', '120 mph', '140 mph'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which rollercoaster has the steepest drop?',
    options: ['Twisted Fury', 'Big Drop', 'Sky Scream', 'Looping Star'],
    correctAnswerIndex: 3,
  ),
  Question(
    questionText: 'Which rollercoaster has the longest track length?',
    options: ['Sky Scream', 'Big Drop', 'Looping Star', 'Twisted Fury'],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: 'What is the oldest rollercoaster in the park?',
    options: ['Big Drop', 'Sky Scream', 'Looping Star', 'Twisted Fury'],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: 'How many loops does Sky Scream have?',
    options: ['3', '4', '5', '6'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which rollercoaster has the most intense acceleration?',
    options: ['Twisted Fury', 'Big Drop', 'Sky Scream', 'Looping Star'],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: 'What is the main theme of Twisted Fury?',
    options: ['Dinosaurs', 'Dragons', 'Space', 'Pirates'],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: 'Which rollercoaster has the longest wait time on average?',
    options: ['Big Drop', 'Sky Scream', 'Looping Star', 'Twisted Fury'],
    correctAnswerIndex: 0,
  ),
];
