import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/formInput.dart';
import 'package:lookmefront/pages/addressList.dart';
import 'package:lookmefront/pages/profile.dart';

import '../components/button.dart';

class AddAddressPage extends StatefulWidget {
  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  late String name;
  late String adresse;
  late String codePostal;
  late String ville;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Ajouter une adresse de \n            livraison",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 100.0),
            child: FormInput("Nom et Prénom", size.width * 0.8, (value) {
              setState(() {
                name = value;
              });
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: FormInput("Adresse", size.width * 0.8, (value) {
              setState(() {
                adresse = value;
              });
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: FormInput("Code Postal", size.width * 0.8, (value) {
              setState(() {
                codePostal = value;
              });
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: FormInput("Ville", size.width * 0.8, (value) {
              setState(() {
                ville = value;
              });
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 15, right: 15),
            child: Button(
                "Sauvegarder l'adresse", true, true, size.width * 0.8, 50, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressListPage(),
                  ));
            }, 5),
          )
        ],
      ),
    );
  }
}
