import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavorisCard extends StatelessWidget {
  const FavorisCard(this.img, this.label, this.price);
  final String img;
  final String label;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ClipRRect(
              child: Image.asset(img, scale: 1.7),
              borderRadius: new BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  label,
                  style: GoogleFonts.nunitoSans(
                      color: Color.fromARGB(255, 87, 86, 86),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Text(
                  price + " €",
                  style: GoogleFonts.merriweather(
                      color: Color.fromARGB(255, 8, 8, 8),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 140),
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  shape: BoxShape.circle),
              child: Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
