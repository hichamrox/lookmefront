import 'package:flutter/material.dart';
import 'package:lookmefront/pages/profile.dart';

class AddOfferPage extends StatefulWidget {
  const AddOfferPage({Key? key}) : super(key: key);

  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
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
                MaterialPageRoute(builder: (context) => ProfilePage()),
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
    );
  }
}
