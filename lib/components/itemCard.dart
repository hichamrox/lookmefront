import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String offerId;
  final double height;
  final double width;
  final String img;
  final String name;
  final String prix;
  final VoidCallback onTapPanier;
  final VoidCallback onTapItem;
  const ItemCard(
      {Key? key,
      required this.offerId,
      required this.height,
      required this.width,
      required this.img,
      required this.name,
      required this.prix,
      required this.onTapPanier,
      required this.onTapItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late int totalCost;

    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTapItem,
              child: Stack(
                children: [
                  Container(
                      height: 140,
                      child: Image.network(
                        img,
                      )),
                  Positioned(
                    child: GestureDetector(
                      child: Image.asset("assets/images/petitPanier.png"),
                      onTap: onTapPanier,
                    ),
                    bottom: 10,
                    right: 5,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 5),
              child: Text(name,
                  style: GoogleFonts.nunitoSans(
                      color: Color.fromARGB(255, 117, 116, 116),
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(prix + " €/jour",
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }
}
