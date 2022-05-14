import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';
import 'package:lookmefront/pages/login.dart';

class BoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: size.height,
          color: Colors.grey,
        ),
        Positioned(
          child: Image.asset("assets/images/boardingImage.png"),
          right: 6,
          bottom: 0,
        ),
        Positioned(
            right: size.width * 0.25,
            bottom: 100,
            child: Center(
                child:
                    Button("Commencer", true, false, size.width * 0.5, 60, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }, 5))),
        Positioned(
            top: 300,
            left: 20,
            child: Text(
              "Choisie ton style",
              style: GoogleFonts.gelasio(
                  fontWeight: FontWeight.w600, fontSize: 30),
            )),
        Positioned(
            top: 400,
            left: 40,
            child: Text(
              "Le style est une manière de dire qui \nvous êtes sans parler.",
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400, fontSize: 20),
            ))
      ]),
    );
  }
}
