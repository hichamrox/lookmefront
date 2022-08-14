import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/formInput.dart';
import 'package:lookmefront/pages/addressList.dart';

import '../components/button.dart';
import '../services/authservices.dart';

class AddAddressPage extends StatefulWidget {
  final userId;
  AddAddressPage(this.userId);
  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  var adress, cp, city;
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
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: FormInput(
              "Adresse",
              size.width * 0.8,
              (value) {
                setState(() {
                  adress = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: FormInput(
              "Code Postal",
              size.width * 0.8,
              (value) {
                setState(() {
                  cp = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: FormInput(
              "Ville",
              size.width * 0.8,
              (value) {
                setState(() {
                  city = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 15, right: 15),
            child: Button(
                "Sauvegarder l'adresse", true, true, size.width * 0.8, 50,
                () async {
              var data = await AuthService().getAdress(widget.userId);
              AuthService()
                  .addAdress(widget.userId, adress, cp, city)
                  .then((val) {
                if (val.data['success']) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressListPage(widget.userId),
                    ),
                  );
                }
              });
            }, 5),
          )
        ],
      ),
    );
  }
}
