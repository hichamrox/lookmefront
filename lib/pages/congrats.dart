import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';

class Congrat extends StatelessWidget {
  const Congrat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Text(
            "Bravo !",
            style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 26, 25, 25),
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
        Image.asset("assets/images/succed.png"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Votre commande sera bientôt \n                   livrée.\n Merci d'avoir choisi notre \n               application !",
            style: GoogleFonts.nunitoSans(
              color: Color.fromARGB(255, 68, 66, 66),
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Button("Contacter le vendeur", true, true, size.width * 0.8,
              50, () {}, 5),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Button("ACCUEIL", false, true, size.width * 0.8, 50, () {}, 5),
        ),
      ],
    ));
  }
}
