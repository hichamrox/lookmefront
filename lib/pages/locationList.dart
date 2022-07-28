import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/locationCard.dart';
import 'package:lookmefront/model/offres.dart';
import 'package:lookmefront/pages/addOffer.dart';

import '../services/authservices.dart';

class LocationListPage extends StatelessWidget {
  const LocationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.search,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 40,
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Mes Locations",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: Stack(children: [
          FutureBuilder<List<Offre>>(
              future: AuthService().getOffreById('629032e2b4b3b5c4d33eeb77'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var offre = (snapshot.data as List<Offre>)[index];
                        return LocationCard(offre.title, offre.cost.toString(),
                            "https://robe-vintage.net/upl/2017/02/robe-vintage-retro-a-pois.png");
                      });
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  throw ("Login");
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
                        builder: (context) => AddOfferPage(),
                      ));
                },
                child: Icon(Icons.add),
              ))
        ])

        /*ListView(
          children: [OrderCard("2344654654", "20/07/2022", 3, 150)],
        )*/
        );
  }
}
