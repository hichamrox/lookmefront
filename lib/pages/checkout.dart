import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';
import 'package:lookmefront/components/checkoutModification.dart';
import 'package:lookmefront/pages/congrats.dart';

class CheckoutPage extends StatefulWidget {
  final String name;
  final String adresse;
  final String cardNumber;
  final String delevery;
  final int price;
  CheckoutPage(
    this.name,
    this.adresse,
    this.cardNumber,
    this.delevery,
    this.price,
  );

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Paiement",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckouModification("Adresse et livraison", () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Container(
              height: size.height * 0.15,
              width: size.width * 0.8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.name,
                        style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.adresse,
                        style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 143, 140, 140),
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ]),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckouModification("Paiement", () {}),
          ),
          Card(
            child: Container(
              height: size.height * 0.1,
              width: size.width * 0.8,
              child: Row(
                children: [
                  Image.asset("assets/images/card.png"),
                  Text(widget.cardNumber.replaceRange(0, 12, "**** **** **** "))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckouModification("Moyen de livraison", () {}),
          ),
          Card(
            child: Container(
              height: size.height * 0.1,
              width: size.width * 0.8,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Image.asset("assets/images/DHL.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      widget.delevery,
                      style: GoogleFonts.nunitoSans(
                        color: Color.fromARGB(255, 26, 25, 25),
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.8,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Produit",
                          style: GoogleFonts.nunitoSans(
                              color: Color.fromARGB(255, 166, 161, 161),
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "€" + widget.price.toString() + ".00",
                          style: GoogleFonts.nunitoSans(
                              color: Color.fromARGB(255, 14, 13, 13),
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Livraison",
                          style: GoogleFonts.nunitoSans(
                              color: Color.fromARGB(255, 166, 161, 161),
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "€ 5.00",
                          style: GoogleFonts.nunitoSans(
                              color: Color.fromARGB(255, 14, 13, 13),
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total",
                          style: GoogleFonts.nunitoSans(
                              color: Color.fromARGB(255, 166, 161, 161),
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "€" + (widget.price + 5).toString() + ".00",
                          style: GoogleFonts.nunitoSans(
                              color: Color.fromARGB(255, 14, 13, 13),
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button("Paiement", true, true, size.width * 0.8, 50, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Congrat(),
                  ));
            }, 5),
          )
        ],
      ),
    );
  }
}
