import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.getStarted, {super.key});

  final void Function() getStarted;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Taskie',
              style: GoogleFonts.jacquardaBastarda9(
                  color: Colors.black,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Organize and schedule yourself..',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton.icon(
              onPressed: getStarted,
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 11, 100, 41),
                textStyle: const TextStyle(fontSize: 15),
              ),
              icon: const Icon(Icons.start),
              label: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
