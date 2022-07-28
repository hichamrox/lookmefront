import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';
import 'package:lookmefront/pages/profile.dart';

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String date;
  final int dayNumber;
  final int totalCost;
  const OrderCard(this.orderNumber, this.date, this.dayNumber, this.totalCost);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Container(
          height: size.height * 0.22,
          width: size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order No: " + orderNumber,
                      style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 14, 13, 13),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Text(
                      date,
                      style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 68, 66, 66),
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nombre de jours: " + dayNumber.toString(),
                      style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 14, 13, 13),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Text(
                      "Prix total: " + totalCost.toString() + " €",
                      style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 14, 13, 13),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                child: Button("Détail", true, true, size.width * 0.25, 40, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
                }, 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
