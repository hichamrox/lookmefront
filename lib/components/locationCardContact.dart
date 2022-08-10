import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationCardContact extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback press;
  const LocationCardContact(this.title, this.img, this.press);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.network(img),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunitoSans(
                        color: Color.fromARGB(255, 68, 66, 66),
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
