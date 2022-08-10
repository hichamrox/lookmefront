import 'package:flutter/material.dart';
import 'package:lookmefront/components/itemCard.dart';
import 'package:lookmefront/pages/cart.dart';
import 'package:lookmefront/pages/product.dart';
import 'package:lookmefront/services/authservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/offres.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('token');
    return print(stringValue);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.search,
            color: Colors.grey,
            size: 40,
          ),
          title: Container(
            height: size.height * 0.06,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
                size: 40,
              ),
            )
          ],
        ),
        body: FutureBuilder<List<Offre>>(
            future: AuthService().getOffers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      var offer = (snapshot.data as List<Offre>)[index];
                      return ItemCard(
                        height: size.height * 0.3,
                        width: size.width * 0.2,
                        img: "assets/images/robeBleu.png",
                        name: offer.title,
                        prix: offer.cost.toString(),
                        onTapPanier: () {
                          getStringValuesSF();
                        },
                        onTapItem: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                    "assets/images/robeBleu.png",
                                    offer.title,
                                    offer.cost,
                                    offer.description,
                                    "30 reviews",
                                    "4,5")),
                          );
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return const CircularProgressIndicator();
              }
            })
        /*body: GridView.count(
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            ItemCard(
              height: size.height * 0.3,
              width: size.width * 0.2,
              img: "assets/images/robeBleu.png",
              name: "robe bleu",
              prix: "25",
              onTapPanier: () {},
              onTapItem: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                          "assets/images/robeBleu.png",
                          "Robe bleu",
                          "50",
                          "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
                          "30 reviews",
                          "4,5")),
                );
              },
            ),
            ItemCard(
              height: size.height * 0.3,
              width: size.width * 0.2,
              img: "assets/images/robeBleu.png",
              name: "robe bleu",
              prix: "25",
              onTapPanier: () {},
              onTapItem: () {},
            ),
            ItemCard(
              height: size.height * 0.3,
              width: size.width * 0.2,
              img: "assets/images/robeBleu.png",
              name: "robe bleu",
              prix: "25",
              onTapPanier: () {},
              onTapItem: () {},
            ),
            ItemCard(
              height: size.height * 0.3,
              width: size.width * 0.2,
              img: "assets/images/robeBleu.png",
              name: "robe bleu",
              prix: "25",
              onTapPanier: () {},
              onTapItem: () {},
            ),
            ItemCard(
              height: size.height * 0.3,
              width: size.width * 0.2,
              img: "assets/images/robeBleu.png",
              name: "robe bleu",
              prix: "25",
              onTapPanier: () {},
              onTapItem: () {},
            ),
            ItemCard(
              height: size.height * 0.3,
              width: size.width * 0.2,
              img: "assets/images/robeBleu.png",
              name: "robe bleu",
              prix: "25",
              onTapPanier: () {},
              onTapItem: () {},
            ),
          ],
        )*/
        );
  }
}
