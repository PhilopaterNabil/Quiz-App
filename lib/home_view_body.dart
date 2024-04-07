import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white.withOpacity(0.7),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter!',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: Colors.white.withOpacity(0.7),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple[900],
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
