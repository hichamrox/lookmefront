import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/pages/settings.dart';

import '../components/button.dart';
import '../components/formInput.dart';

class EditEmailPage extends StatefulWidget {
  const EditEmailPage({Key? key}) : super(key: key);

  @override
  _EditEmailPageState createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  late String email;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Chager Email",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: Column(
          children: [
            FormInput(
              "Email",
              size.width * 0.8,
              (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Center(
                child: Button(
                    "Modifier Email", true, true, size.width * 0.7, 50, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SittingPage()),
                  );
                }, 10),
              ),
            ),
          ],
        ));
  }
}
