import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_class.dart';

class BottomButton extends StatelessWidget {
late final Color backColors;
late final String buttontext;
late final VoidCallback function;
BottomButton(
    {required this.backColors,
      required this.buttontext,
      required this.function});

@override
Widget build(BuildContext context) {
  return Expanded(
    child: InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backColors,
        ),
        child: Center(
          child: Text(
            '${buttontext}',
            style: GoogleFonts.roboto(
              letterSpacing: 1,
              fontSize: 18,
              color: backColors == Colors.black
                  ? cColor().yellow
                  : cColor().darkBrown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
}
