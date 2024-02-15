import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class wrong_guess extends StatelessWidget {
  const wrong_guess({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 168, 191),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        title: const Text(
          "Guess Game !",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Sorry! Wrong guess. Please try again.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Icon(
            Icons.error_outline_rounded,
            size: 80,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child:
                const Text("Try Again", style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
