import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/mdpInput.dart';
import 'package:lookmefront/pages/settings.dart';

import '../components/button.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  late String password;
  late String confPassword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "FAQ",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: MdpInput(
              "Nouveau Mot de passe",
              size.width * 0.8,
              (value) {
                setState(() {
                  password = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 40),
            child: MdpInput(
              "Confirmer le mot de passe",
              size.width * 0.8,
              (value) {
                setState(() {
                  password = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Center(
              child: Button(
                  "Modifier Mot de Passe", true, true, size.width * 0.7, 50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SittingPage()),
                );
              }, 10),
            ),
          ),
        ],
      ),
    );
  }
}
