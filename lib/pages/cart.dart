import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';
import 'package:lookmefront/components/cartCard.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double price1 = 50;
  double price2 = 50;
  double price3 = 50;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Panier",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CartCard(
                  "assets/images/robeBleu.png", "Robe bleu", price1.toString()),
              CartCard(
                  "assets/images/robeBleu.png", "Robe bleu", price2.toString()),
              CartCard(
                  "assets/images/robeBleu.png", "Robe bleu", price3.toString()),
            ],
          ),
          Positioned(
              bottom: 80,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("Total :",
                        style: GoogleFonts.nunitoSans(
                            color: Color.fromARGB(255, 88, 88, 88),
                            fontWeight: FontWeight.w600,
                            fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: Text((price1 + price2 + price3).toString() + " €",
                        style: GoogleFonts.nunitoSans(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                            fontSize: 25)),
                  ),
                ],
              )),
          Positioned(
              bottom: 5,
              left: 35,
              child: Button(
                  "Paiement", true, true, size.width * 0.8, 50, () {}, 5))
        ],
      ),
    );
  }
}
