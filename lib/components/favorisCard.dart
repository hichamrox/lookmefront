import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/favorite.dart';
import '../services/authservices.dart';

class FavorisCard extends StatelessWidget {
  const FavorisCard(this.img, this.label, this.id);
  final String img;
  final String label;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              child: Image.network(img, scale: 10),
              borderRadius: new BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            Text(
              label,
              style: GoogleFonts.nunitoSans(
                  color: Color.fromARGB(255, 87, 86, 86),
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
            IconButton(
              onPressed: () async {
                await AuthService().deleteFavori(id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ),
                );
              },
              icon: Container(
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
      ),
    );
  }
}
