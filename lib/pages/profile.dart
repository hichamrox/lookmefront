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
    prefs.remove("userData");
  }

  Future<String> getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String name = prefs.getString('name').toString();
    String userId = prefs.getString('userId').toString();
    String image = prefs.getString('image').toString();

    return name + "," + email + "," + userId + "," + image;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<String>(
        future: getInfo(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
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
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
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
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data.toString().split(",")[3]),
                            radius: 30,
                          ),
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                                padding: EdgeInsets.all(7.5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: BorderRadius.circular(90.0),
                                    color: Colors.green))),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              child: Icon(
                                Icons.edit_outlined,
                                size: 23,
                              ),
                              onTap: () {},
                            ))
                      ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data.toString().split(",")[0],
                            style: GoogleFonts.nunitoSans(
                                color: Color.fromARGB(255, 20, 20, 20),
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            snapshot.data.toString().split(",")[1],
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
                  child: CarteProfil("Mes locations", "Already have 10 orders",
                      (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationListPage(
                              snapshot.data.toString().split(",")[2]),
                        ));
                  })),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarteProfil("Mes Commandes", "Already have 8 orders",
                      (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrdersPage(
                              snapshot.data.toString().split(",")[2]),
                        ));
                  })),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      CarteProfil("Adresses de livraison", "3 adresses", (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressListPage(
                              snapshot.data.toString().split(",")[2]),
                        ));
                  })),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarteProfil(
                      "Méthode de paiment", "2 cartes enregistrés", () {}),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarteProfil(
                      "Mes évaluations", "2valuation 1 2 3 4 5", () {}),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarteProfil(
                      "Paramètres", "Notifications, Password, FAQ", (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SittingPage(
                              snapshot.data.toString().split(",")[2],
                              snapshot.data.toString().split(",")[0],
                              snapshot.data.toString().split(",")[1]),
                        ));
                  })),
                ),
              ]),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
