import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/formInput.dart';
import 'package:lookmefront/pages/login.dart';
import 'package:lookmefront/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/button.dart';
import '../services/authservices.dart';

class EditInformationsPage extends StatefulWidget {
  final name;
  final userId;
  final email;
  EditInformationsPage(this.userId, this.name, this.email);

  @override
  _EditInformationsPageState createState() => _EditInformationsPageState();
}

class _EditInformationsPageState extends State<EditInformationsPage> {
  late String newName;
  setName(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Chager Coordonnées",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: Column(
          children: [
            FormInput(
              "Nom et prénom",
              size.width * 0.8,
              (value) {
                setState(() {
                  newName = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Center(
                child: Button(
                    "Modifier Nom et prénom", true, true, size.width * 0.7, 50,
                    () async {
                  await setName(newName);
                  AuthService().updateName(widget.userId, newName).then((val) {
                    if (val.data['success']) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SittingPage(
                                widget.userId, newName, widget.email)),
                      );
                    } else
                      print("le changement n'est pas fait");
                  });
                }, 10),
              ),
            ),
          ],
        ));
  }
}
