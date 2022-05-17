import 'package:flutter/material.dart';
import 'package:lookmefront/components/itemCard.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(children: [
      Container(
        height: size.height,
      ),
      ItemCard(
        height: size.height * 0.3,
        width: size.width * 0.3,
        img: "assets/images/robeBleu.png",
        name: "robe bleu",
        prix: "25",
        onTapPanier: () {},
        onTapItem: () {},
      ),
    ]);
  }
}
