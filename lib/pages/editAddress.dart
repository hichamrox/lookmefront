import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';
import '../components/formInput.dart';
import 'addressList.dart';

class EditAddressPage extends StatefulWidget {

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late String name;
  late String adresse;
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
