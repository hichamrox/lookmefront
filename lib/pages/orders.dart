import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/orderCard.dart';
import '../model/order.dart';
import '../services/authservices.dart';

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
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Commandes",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: FutureBuilder<List<Order>>(
            future: AuthService().getOrder('629032e2b4b3b5c4d33eeb77'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var order = (snapshot.data as List<Order>)[index];
                      return OrderCard(
                          order.id.substring(order.id.length - 8),
                          order.createdAt.toString().substring(0, 10),
                          order.days,
                          order.cost);
                    });
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                throw ("Login");
              }
            }));
  }
}
