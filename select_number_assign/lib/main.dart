import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Select The Correct Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  late int correctAns;
  int score = 0;

  var mc1 = '';
  var mc2 = '';
  var mc3 = '';
  late bool correct = false;
  List<int> multipleChoice = [];
  @override
  // ignore: must_call_super
  void initState() {
    numbers.shuffle(); // shuffle for random
    List<int> randomList = numbers;
    debugPrint(numbers.toString());
    multipleChoice = randomList.take(3).toList();
    setState(() {
      correctAns = multipleChoice[1].toInt();
      multipleChoice.shuffle();
      final mcMap = multipleChoice.asMap();
      mc1 = mcMap[0].toString();
      mc2 = mcMap[1].toString();
      mc3 = mcMap[2].toString();
    });

    debugPrint(mc1.toString());
    debugPrint(correctAns.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text("Please select $correctAns"),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (correctAns.toString() == mc1) {
                    setState(() {
                      correct = true;
                      score = score + 10;
                    });
                  }
                }, // Handle your callback.
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/' + mc1 + '.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (correctAns.toString() == mc2) {
                    setState(() {
                      correct = true;
                      score = score + 10;
                    });
                  }
                }, // Handle your callback.
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/' + mc2 + '.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (correctAns.toString() == mc3) {
                    setState(() {
                      correct = true;
                      score = score + 10;
                    });
                  }
                }, // Handle your callback.
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/' + mc3 + '.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  correct
                      ? const Text("Your Answer is Correct")
                      : const Text("Your Answer is Incorrect"),
                ],
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    multipleChoice.shuffle();
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                ),
                child: const Text("Next"),
              ),
              Text("Your Score $score"),
            ],
          ),
        ),
      ),
    );
  }
}
