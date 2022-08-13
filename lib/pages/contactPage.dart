import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Contact",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Text(
                "Tél: +33 (0)6 11 65 ** **",
                style: GoogleFonts.merriweather(
                  color: Color.fromARGB(255, 23, 23, 23),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                "Email: hello@lookateme.com",
                style: GoogleFonts.merriweather(
                    color: Color.fromARGB(255, 23, 23, 23),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ],
          ),
        )));
  }
}
