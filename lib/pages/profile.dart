import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/carteProfil.dart';
import 'package:lookmefront/pages/addAddress.dart';
import 'package:lookmefront/pages/addOffer.dart';
import 'package:lookmefront/pages/addressList.dart';
import 'package:lookmefront/pages/locationList.dart';
import 'package:lookmefront/pages/login.dart';
import 'package:lookmefront/pages/orders.dart';
import 'package:lookmefront/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/button.dart';
import '../services/authservices.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.search,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 40,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              removeValues();
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginPage();
                  },
                ),
                (_) => false,
              );
            },
            child: Icon(
              Icons.logout,
              color: Color.fromARGB(255, 81, 79, 79),
              size: 30,
            ),
          )
        ],
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: ListView(children: [
        Container(
          child: Row(
            children: [
              CircleAvatar(
                child: Image.network(
                    "https://res.cloudinary.com/dshuazgaz/image/upload/v1605731267/bpayfekmwaruliopixxw.png"),
                radius: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Marwa",
                    style: GoogleFonts.nunitoSans(
                        color: Color.fromARGB(255, 20, 20, 20),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "Marwa@test.fr",
                    style: GoogleFonts.nunitoSans(
                        color: Color.fromARGB(255, 91, 90, 90),
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarteProfil("Mes locations", "Already have 10 orders", (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationListPage(),
                ));
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarteProfil("Mes Commandes", "Already have 8 orders", (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersPage(),
                ));
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarteProfil("Adresses de livraison", "3 adresses", (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddressListPage(),
                ));
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              CarteProfil("Méthode de paiment", "2 cartes enregistrés", () {}),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarteProfil("Mes évaluations", "2valuation 1 2 3 4 5", () {}),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarteProfil("Paramètres", "Notifications, Password, FAQ", (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SittingPage(),
                ));
          })),
        ),
      ]),
    );
  }
}
