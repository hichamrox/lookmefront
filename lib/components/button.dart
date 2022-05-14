import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String title;
  final bool active;
  final bool home;
  final double width;
  final double height;
  final VoidCallback press;
  final double curve;
  Button(this.title, this.active, this.home, this.width, this.height,
      this.press, this.curve);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: (active) ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(curve),
            ),
            child: Center(
                child: Text(
              title,
              style: (home)
                  ? GoogleFonts.nunitoSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: (active) ? Colors.white : Colors.black,
                    )
                  : GoogleFonts.gelasio(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: (active) ? Colors.white : Colors.black,
                    ),
            ))));
  }
}
