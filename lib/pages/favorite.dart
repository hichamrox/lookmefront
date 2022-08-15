import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';
import 'package:lookmefront/components/cartCard.dart';
import 'package:lookmefront/components/favorisCard.dart';
import 'package:lookmefront/model/favori.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/authservices.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.search,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 40,
          ),
          title: Text(
            "Favoris",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: FutureBuilder<List<Favori>>(
            future: AuthService().getFavorisByUserId(),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var favori = (snapshot.data as List<Favori>)[index];
                      return FavorisCard(favori.image, favori.title, favori.id);
                    });
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return const CircularProgressIndicator();
              }
            })
        // Stack(
        //   children: [
        //     ListView(
        //       children: [
        //         FavorisCard("assets/images/robeBleu.png", "Robe bleu", "50 €"),
        //         FavorisCard("assets/images/robeBleu.png", "Robe bleu", "50 €"),
        //         FavorisCard("assets/images/robeBleu.png", "Robe bleu", "50 €"),
        //       ],
        //     ),
        //     Positioned(
        //         bottom: 5,
        //         left: 35,
        //         child: Button("Tout ajouter au panier", true, true,
        //             size.width * 0.8, 50, () {}, 5))
        //   ],
        // ),
        );
  }
}
