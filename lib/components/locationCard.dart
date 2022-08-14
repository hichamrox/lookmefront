import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationCard extends StatelessWidget {
  final String title;
  final String price;
  final String img;
  const LocationCard(this.title, this.price, this.img, this.onTapIcon);
  final VoidCallback onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.network(img),
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 68, 66, 66),
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    Text(
                      price,
                      style: GoogleFonts.nunitoSans(
                          color: Color.fromARGB(255, 68, 66, 66),
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    )
                  ],
                ),
              ],
            ),
            InkWell(
              child: Icon(
                Icons.delete_forever_outlined,
                size: 33,
              ),
              onTap: onTapIcon,
            )
          ],
        ),
      ),
    );
  }
}
