import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

// ===============================
// Quiz App
// ===============================

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const QuizPage(),
    );
  }
}

// ===============================
// Quiz Page
// ===============================

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  // ===============================
  // Questions
  // ===============================

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is Flutter?',
      'answers': [
        'Framework',
        'Database',
        'Browser',
        'Operating System',
      ],
      'correct': 'Framework',
    },
    {
      'question': 'Which language does Flutter use?',
      'answers': [
        'Java',
        'Dart',
        'Python',
        'PHP',
      ],
      'correct': 'Dart',
    },
    {
      'question': 'What is 2 + 2?',
      'answers': [
        '3',
        '4',
        '5',
        '6',
      ],
      'correct': '4',
    },
    {
      'question': 'Which company created Flutter?',
      'answers': [
        'Google',
        'Apple',
        'Microsoft',
        'Amazon',
      ],
      'correct': 'Google',
    },
    {
      'question': 'Can Flutter build mobile apps?',
      'answers': [
        'Yes',
        'No',
        'Only websites',
        'Only games',
      ],
      'correct': 'Yes',
    },
    {
      'question': 'What does UI stand for?',
      'answers': [
        'User Interface',
        'User Internet',
        'Universal Input',
        'User Information',
      ],
      'correct': 'User Interface',
    },
    {
      'question': 'What does API stand for?',
      'answers': [
        'Application Programming Interface',
        'Application Program Internet',
        'Advanced Programming Input',
        'Application Process Interface',
      ],
      'correct': 'Application Programming Interface',
    },
    {
      'question': 'Which widget is used for displaying text in Flutter?',
      'answers': [
        'Text',
        'Image',
        'Button',
        'Container',
      ],
      'correct': 'Text',
    },
    {
      'question': 'Which widget is used to create a button?',
      'answers': [
        'Text',
        'ElevatedButton',
        'Column',
        'Row',
      ],
      'correct': 'ElevatedButton',
    },
    {
      'question': 'What is Dart?',
      'answers': [
        'Programming language',
        'Database',
        'Operating system',
        'Browser',
      ],
      'correct': 'Programming language',
    },
    {
      'question': 'Which widget arranges children vertically?',
      'answers': [
        'Row',
        'Column',
        'Stack',
        'Container',
      ],
      'correct': 'Column',
    },
    {
      'question': 'Which widget arranges children horizontally?',
      'answers': [
        'Column',
        'Row',
        'Stack',
        'Center',
      ],
      'correct': 'Row',
    },
    {
      'question': 'What does setState() do?',
      'answers': [
        'Updates the UI',
        'Deletes the app',
        'Closes the app',
        'Creates a database',
      ],
      'correct': 'Updates the UI',
    },
    {
      'question': 'Which widget is used as the main structure of a Flutter page?',
      'answers': [
        'Scaffold',
        'Text',
        'Row',
        'Image',
      ],
      'correct': 'Scaffold',
    },
    {
      'question': 'What does StatelessWidget mean?',
      'answers': [
        'Widget without mutable state',
        'Widget with a database',
        'Widget for images only',
        'Widget for navigation only',
      ],
      'correct': 'Widget without mutable state',
    },
  ];

  // ===============================
  // Answer Question
  // ===============================

  void answerQuestion(String answer) {
    if (answer == questions[questionIndex]['correct']) {
      score++;
    }

    setState(() {
      questionIndex++;
    });
  }

  // ===============================
  // Restart Quiz
  // ===============================

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  // ===============================
  // Build UI
  // ===============================

  @override
  Widget build(BuildContext context) {
    // ===============================
    // Result Screen
    // ===============================

    if (questionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_events,
                  size: 90,
                  color: Colors.amber,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Quiz Finished!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  'Your Score',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  '$score / ${questions.length}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: restartQuiz,
                    icon: const Icon(Icons.refresh),
                    label: const Text(
                      'Restart Quiz',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // ===============================
    // Current Question
    // ===============================

    final Map<String, dynamic> question =
        questions[questionIndex];

    final List<String> answers =
        List<String>.from(question['answers']);

    // ===============================
    // Quiz Screen
    // ===============================

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Question Number
            Text(
              'Question ${questionIndex + 1} / ${questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 15),

            // Progress Bar
            LinearProgressIndicator(
              value: (questionIndex + 1) / questions.length,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 40),

            // Question
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Text(
                question['question'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Answers
            Expanded(
              child: ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  final answer = answers[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),

                    child: SizedBox(
                      height: 55,

                      child: ElevatedButton(
                        onPressed: () {
                          answerQuestion(answer);
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                        ),

                        child: Text(
                          answer,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Score
            Text(
              'Current Score: $score',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}