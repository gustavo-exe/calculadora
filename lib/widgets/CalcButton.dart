import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final Color bgColor;
  const CalcButton(
      {super.key,
      required this.callback,
      required this.text,
      this.textSize = 28.0,
      this.bgColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
          ),
          onPressed: () => {callback(text)},
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: textSize, color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
