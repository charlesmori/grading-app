import 'package:flutter/material.dart';

void main() {
  runApp(const GradeApp());
}

class GradeApp extends StatelessWidget {
  const GradeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grading App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GradeCalculator(
        title: 'Grading App',
      ),
    );
  }
}

class GradeCalculator extends StatefulWidget {
  const GradeCalculator({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<GradeCalculator> createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  final TextEditingController _controller = TextEditingController();
  String _grade = "";

  void _calculateGrade() {
    setState(() {
      double? number = double.tryParse(_controller.text);
      if (number == null || number < 0 || number > 100) {
        _grade = "Invalid input. Enter a number between 0 and 100.";
      } else if (number >= 90) {
        _grade = "Grade: A";
      } else if (number >= 80) {
        _grade = "Grade: B";
      } else if (number >= 70) {
        _grade = "Grade: C";
      } else if (number >= 60) {
        _grade = "Grade: D";
      } else {
        _grade = "Grade: F";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number (0-100)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateGrade,
              child: const Text('Calculate Grade'),
            ),
            const SizedBox(height: 20),
            Text(
              _grade,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
