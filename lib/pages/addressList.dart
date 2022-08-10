import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/model/adress.dart';
import 'package:lookmefront/pages/addAddress.dart';
import 'package:lookmefront/pages/editAddress.dart';

import '../components/addressCard.dart';
import '../services/authservices.dart';

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
        FutureBuilder<List<Adress>>(
            future: AuthService().getAdress('629032e2b4b3b5c4d33eeb77'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var adress = (snapshot.data as List<Adress>)[index];
                      return AddressCard(
                        adress.city,
                        adress.adress,
                        adress.cp.toString(),
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditAddressPage(),
                              ));
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return const CircularProgressIndicator();
              }
            }),
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
