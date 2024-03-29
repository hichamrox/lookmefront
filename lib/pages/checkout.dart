import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';
import 'package:lookmefront/components/checkoutModification.dart';
import 'package:lookmefront/model/adress.dart';
import 'package:lookmefront/pages/accueil.dart';
import 'package:lookmefront/pages/congrats.dart';
import 'package:lookmefront/pages/profile.dart';
import 'package:lookmefront/services/authservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutPage extends StatefulWidget {
  final String userId;
  final String offerId;
  final String sellerId;
  final String image;
  final String name;
  final String description;
  final String cardNumber;
  final String delevery;
  final int price;
  final int jours;
  CheckoutPage(this.userId, this.offerId, this.sellerId, this.image, this.name,
      this.description, this.cardNumber, this.delevery, this.price, this.jours);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

/*Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceID = 'service_64kz2nc';
  const templateID = 'template_0u5bmb5';
  const publicKey = 'user_MHnLpCSp1i5VWkofm2vyl';
  // const publicKey = '';
  var templateParams = {
    'to_name': name,
    'replay_to': email,
    'message': message
  };

  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json'
      }, //This line makes sure it works for all platforms.
      body: json.encode({
        'serviceID': serviceID,
        'templateID': templateID,
        'publicKey': publicKey,
        // 'publicKey':publicKey,
        'template_params': {
          'to_name': name,
          'replay_to': email,
          'message': message
        }
      }));
  return response.statusCode;
}*/

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Paiement",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: FutureBuilder<List<Adress>>(
            future: AuthService().getAdress(widget.userId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckouModification("Adresse et livraison",
                          snapshot.data as List<Adress>, () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: Container(
                        height: size.height * 0.15,
                        width: size.width * 0.8,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.name,
                                  style: GoogleFonts.nunitoSans(
                                    color: Color.fromARGB(255, 8, 8, 8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.description,
                                  style: GoogleFonts.nunitoSans(
                                    color: Color.fromARGB(255, 143, 140, 140),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ]),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Paiement",
                              style: GoogleFonts.nunitoSans(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.mode_edit_outline),
                          )
                        ],
                      ),
                    ),
                    Card(
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width * 0.8,
                        child: Row(
                          children: [
                            Image.asset("assets/images/card.png"),
                            Text(widget.cardNumber
                                .replaceRange(0, 12, "**** **** **** "))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Moyen de livraison",
                              style: GoogleFonts.nunitoSans(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.mode_edit_outline),
                          )
                        ],
                      ),
                    ),
                    Card(
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width * 0.8,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Image.asset("assets/images/DHL.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                widget.delevery,
                                style: GoogleFonts.nunitoSans(
                                  color: Color.fromARGB(255, 26, 25, 25),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.8,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Produit",
                                    style: GoogleFonts.nunitoSans(
                                        color:
                                            Color.fromARGB(255, 166, 161, 161),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "€" +
                                        (widget.price * widget.jours)
                                            .toString() +
                                        ".00",
                                    style: GoogleFonts.nunitoSans(
                                        color: Color.fromARGB(255, 14, 13, 13),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Livraison",
                                    style: GoogleFonts.nunitoSans(
                                        color:
                                            Color.fromARGB(255, 166, 161, 161),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "€ 5.00",
                                    style: GoogleFonts.nunitoSans(
                                        color: Color.fromARGB(255, 14, 13, 13),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total",
                                    style: GoogleFonts.nunitoSans(
                                        color:
                                            Color.fromARGB(255, 166, 161, 161),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "€" +
                                        (widget.price * widget.jours + 5)
                                            .toString() +
                                        ".00",
                                    style: GoogleFonts.nunitoSans(
                                        color: Color.fromARGB(255, 14, 13, 13),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Button("Paiement", true, true, size.width * 0.8, 50,
                              () async {
                        if (!(widget.sellerId == widget.userId)) {
                          var id = await AuthService().addOrder(
                              widget.userId,
                              widget.price * widget.jours,
                              widget.jours,
                              widget.offerId);
                          /*await sendEmail(widget.name, "marwa.brj@gmail.com",
                                  "hello ceci est un message de marwa")
                              .then((value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    value == 200
                                        ? const SnackBar(
                                            content: Text('Message Sent!'),
                                            backgroundColor: Colors.green)
                                        : const SnackBar(
                                            content:
                                                Text('Failed to send message!'),
                                            backgroundColor: Colors.red),
                                  ));*/
                          await AuthService().addChat(
                              widget.sellerId,
                              widget.userId,
                              id.toString(),
                              widget.image,
                              widget.name);

                          Fluttertoast.showToast(
                              timeInSecForIosWeb: 3,
                              msg: "Votre commande est passé avec succé !",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Color.fromARGB(255, 48, 246, 51),
                              textColor: Colors.white,
                              fontSize: 16);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                        } else {
                          Fluttertoast.showToast(
                              timeInSecForIosWeb: 3,
                              msg:
                                  "Vous ne pouvez pas passer cette commande car il s'agit de votre offre !",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Color.fromARGB(255, 209, 68, 44),
                              textColor: Colors.white,
                              fontSize: 16);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccueilPage(),
                              ));
                        }
                      }, 5),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
