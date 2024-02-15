import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_game/correct_guess.dart';
import 'package:guess_game/game_over.dart';

import 'wrong_guess.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: homeScreen());
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final TextEditingController numcontroller = TextEditingController();
  final Random _random = Random();
  int? _num;
  int? _guess;
  int _try = 0;

  @override
  void initState() {
    super.initState();
    _num = _random.nextInt(10) + 1;
  }

  void checkGuess() {
    // Check if userGuess is null or 0
    if (_guess == null || _guess == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Please Enter a Number!"),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                  child: const Text(
                    "OK",
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }
    if (_guess == _num) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => correct_guess(
            num: _num!,
          ),
        ),
      );
    } else {
      setState(
        () {
          _try++;
        },
      );

      if (_try < 3) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const wrong_guess(),
          ),
        );
        numcontroller.text = "";
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => gameOver(num: _num!),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guess Game',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Image.asset("assets/images/detective.png", height: 220, width: 220),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "I have a secret number in my mind (1-10). You have 3 chances to guess it.Can you guess it?",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              ' $_try of the 3 chances are taken',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                TextField(
                    controller: numcontroller,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => setState(() {
                          _guess = int.tryParse(value);
                        })),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: checkGuess,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
