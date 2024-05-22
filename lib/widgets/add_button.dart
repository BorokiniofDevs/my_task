import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {super.key,
      required this.action,
      required this.buttonText,
      required this.color});

  final void Function() action;
  final String buttonText;
  final Color color;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 19, 128, 104),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
