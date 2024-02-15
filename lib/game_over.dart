import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_game/main.dart';

class gameOver extends StatelessWidget {
  final int num;

  const gameOver({
    super.key,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 216, 230),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Guess Game",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              "Game Over",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.cancel_rounded,
              size: 100,
            ),
            const Center(
              child: Text(
                "My secret number is :",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              num.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const homeScreen())),
              child: const Text(
                "Start Again",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
