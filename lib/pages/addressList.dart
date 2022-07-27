import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/pages/addAddress.dart';

import '../components/addressCard.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage();

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
      body: Stack(children: [
        ListView(
          children: [
            AddressCard("Marwa", "adresse de marwa"),
          ],
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              foregroundColor: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAddressPage(),
                    ));
              },
              child: Icon(Icons.add),
            ))
      ]),
    );
  }
}
