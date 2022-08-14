import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';

class ChoixDiscussionPage extends StatelessWidget {
  const ChoixDiscussionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.search,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 40,
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Ma messagerie",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: Center(
        child: Row(
          children: [
            Button("Mes achats", true, false, 160, 60, () {}, 10),
            Button("Mes ventes", false, false, 160, 60, () {}, 10)
          ],
        ),
      ),
    );
  }
}
