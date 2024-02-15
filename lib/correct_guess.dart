import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class correct_guess extends StatelessWidget {
  final int num;
  const correct_guess({
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
      backgroundColor: const Color.fromARGB(255, 180, 210, 223),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "Guess Game",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_box_rounded,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              "Yes ! You've guessed it right.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              "My Secret Number is",
            ),
          ),
          Text(
            num.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const homeScreen())),
            child: const Text("Start Again",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
