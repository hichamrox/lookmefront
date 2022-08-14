import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/orderCard.dart';
import '../model/order.dart';
import '../services/authservices.dart';

class OrdersPage extends StatelessWidget {
  final String userId;
  OrdersPage(this.userId);

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
            future: AuthService().getOrder(userId),
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
                          order.cost,
                          order.offerId);
                    });
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
