import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/orderCard.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.search,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 40,
          ),
          actions: [
            Icon(
              Icons.logout,
              color: Color.fromARGB(255, 81, 79, 79),
              size: 30,
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
        body: ListView(
          children: [OrderCard("2344654654", "20/07/2022", 3, 150)],
        ));
  }
}
