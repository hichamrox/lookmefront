import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckouModification extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  CheckouModification(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.nunitoSans(
                  color: Color.fromARGB(255, 166, 161, 161),
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.mode_edit_outline),
          )
        ],
      ),
    );
  }
}
