import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarteProfil extends StatelessWidget {
  final String title;
  final String info;
  final VoidCallback onTap;

  const CarteProfil(this.title, this.info, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: GoogleFonts.nunitoSans(
                        color: Color.fromARGB(255, 23, 23, 23),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    info,
                    style: GoogleFonts.nunitoSans(
                        color: Color.fromARGB(255, 91, 90, 90),
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            GestureDetector(onTap: onTap, child: Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}
