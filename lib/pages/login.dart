import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/formInput.dart';
import 'package:lookmefront/pages/home.dart';
import 'package:lookmefront/pages/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lookmefront/services/authservices.dart';
import '../components/button.dart';
import '../components/mdpInput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name, password, token;
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
              "Bonjour !",
              style: GoogleFonts.merriweather(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Heureux de vous revoir",
              style: GoogleFonts.merriweather(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: FormInput(
              "Email",
              size.width * 0.8,
              (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 40),
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
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Text(
                "Mot de passe oublié",
                style: GoogleFonts.nunitoSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Center(
              child:
                  Button("Se connecter", true, true, size.width * 0.7, 50, () {
                AuthService().login(name, password).then((val) {
                  if (val.data['success']) {
                    token = val.data['token'];
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                });
              }, 10),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: Center(
              child: Text(
                "S'inscrire",
                style: GoogleFonts.nunitoSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
