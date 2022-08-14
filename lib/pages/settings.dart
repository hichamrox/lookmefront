import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/carteProfil.dart';
import 'package:lookmefront/pages/contactPage.dart';
import 'package:lookmefront/pages/editEmail.dart';
import 'package:lookmefront/pages/editPassword.dart';
import 'package:lookmefront/pages/editPersonnalInformations.dart';
import 'package:lookmefront/pages/faqPage.dart';

class SittingPage extends StatefulWidget {
  final userId;
  final name;
  final email;
  SittingPage(this.userId, this.name, this.email);

  //final VoidCallback onTap;
  //const SittingPage(this.onTap);

  @override
  _SittingPageState createState() => _SittingPageState();
}

class _SittingPageState extends State<SittingPage> {
  @override
  Widget build(BuildContext context) {
    bool _lights = true;
    bool _lightsNouv = false;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Paramètre",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 12, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Informations personnels",
                  style: GoogleFonts.merriweather(
                      color: Color.fromARGB(255, 70, 69, 69),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                Icon(
                  Icons.mode_edit_outlined,
                  size: 35,
                )
              ],
            ),
          ),
          CarteProfil("Nom et Prénom", widget.name, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditInformationsPage(
                      widget.userId, widget.name, widget.email),
                ));
          }),
          CarteProfil("E-mail", widget.email, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditEmailPage(widget.userId, widget.name, widget.email),
                ));
          }),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 12, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Changer Mot de passe",
                  style: GoogleFonts.merriweather(
                      color: Color.fromARGB(255, 70, 69, 69),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          CarteProfil("Mot de passe", "**************", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPasswordPage(widget.userId),
                ));
          }),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 12, left: 10),
            child: Text(
              "Notifications",
              style: GoogleFonts.merriweather(
                  color: Color.fromARGB(255, 70, 69, 69),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Message",
                    style: GoogleFonts.merriweather(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _lights = !_lights;
                      });
                    },
                    child: CupertinoSwitch(
                      value: _lights,
                      onChanged: (bool value) {
                        setState(() {
                          _lights = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nouveauté",
                    style: GoogleFonts.merriweather(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _lightsNouv = !_lightsNouv;
                      });
                    },
                    child: CupertinoSwitch(
                      value: _lightsNouv,
                      onChanged: (bool value) {
                        setState(() {
                          _lightsNouv = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 12, left: 10),
            child: Text(
              "Centre d'aide",
              style: GoogleFonts.merriweather(
                  color: Color.fromARGB(255, 70, 69, 69),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FAQ",
                    style: GoogleFonts.merriweather(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                  GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FaqPage(),
                            ));
                      }),
                      child: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nous contacter",
                    style: GoogleFonts.merriweather(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                  GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactPage(),
                            ));
                      }),
                      child: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
