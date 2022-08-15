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
  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();
    return userId;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<String>(
        future: getUserId(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 40,
                  ),
                  title: Text(
                    "Favoris",
                    style: GoogleFonts.merriweather(
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  actions: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.grey,
                      size: 40,
                    )
                  ],
                ),
                body: FutureBuilder<List<Favori>>(
                    future: AuthService()
                        .getFavorisByUserId("62f9837b8facb00f864816ba"),
                    builder: (context, AsyncSnapshot snapshot2) {
                      print("heloooooooo" + snapshot2.data.toString());
                      if (snapshot2.hasData) {
                        return ListView.builder(
                            itemCount: snapshot2.data?.length,
                            itemBuilder: (context, index) {
                              var favori =
                                  (snapshot2.data as List<Favori>)[index];
                              return FavorisCard(favori.image, favori.title);
                            });
                      } else if (snapshot2.hasError) {
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
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
