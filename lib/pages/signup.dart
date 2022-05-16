import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/formInput.dart';

import '../components/button.dart';
import '../components/mdpInput.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late String name;
  late String mail;
  late String password;
  late String confPassword;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
          ),
          Center(child: Image.asset("assets/images/logo.png")),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, bottom: 10),
            child: Text(
              "Bonjour ",
              style: GoogleFonts.merriweather(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: FormInput(
              "Nom et prénom",
              size.width * 0.8,
              (value) {
                setState(() {
                  mail = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: FormInput(
              "Email",
              size.width * 0.8,
              (value) {
                setState(() {
                  mail = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: MdpInput(
              "Mot de passe",
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
              child: Button("S'inscrire", true, true, size.width * 0.7, 50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }, 10),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Vous avez déja un compte?",
                  style: GoogleFonts.nunitoSans(
                      color: Color.fromARGB(255, 150, 149, 149),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Center(
                  child: Text(
                    " Se connecter",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
