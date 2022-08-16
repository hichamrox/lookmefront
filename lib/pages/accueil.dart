import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/itemCard.dart';
import 'package:lookmefront/model/offres.dart';
import 'package:lookmefront/pages/product.dart';
import 'package:lookmefront/services/authservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // return print(stringValue);
  }

  List<String> morphologys = ["A", "V", "H", "8", ""];
  List<String> sizes = ["XS", "S", "M", "L", "XL", ""];
  String morphology = "";
  String taille = "";
  late List maList;
  late List<Offre> filtre;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 40,
            ),
          ),
          title: Container(
            height: size.height * 0.06,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
        body: FutureBuilder<List<Offre>>(
            future: AuthService().getOffers(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                maList = snapshot.data as List;
                filtre = [];
                maList.forEach(
                  (e) {
                    var el = e as Offre;
                    if (taille.toString().isEmpty &&
                        morphology.toString().isEmpty) {
                      filtre.add(el);
                      print("test1:::::" + filtre.toString());
                    } else if (taille == el.size &&
                        morphology == el.morphology) {
                      print("test2:::::" + filtre.toString());
                      filtre.add(el);
                    } else if (taille == el.size) {
                      filtre.add(el);
                    } else if (morphology == el.morphology) {
                      filtre.add(el);
                    }
                  },
                );

                // if (taille.toString().isEmpty &&
                //     morphology.toString().isEmpty) {
                // } else if (taille == offer.size) {
                // } else if (morphology == offer.morphology) {}
                return Stack(
                  children: [
                    Column(
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: Text(
                                    "Taille",
                                    style: GoogleFonts.nunitoSans(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.2,
                                  child: DropdownButton(
                                    //size.width * 0.4,
                                    isExpanded: true,
                                    value: taille,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    items: sizes.map((String items) {
                                      return DropdownMenuItem(
                                          value: items,
                                          child: Text(items,
                                              style: GoogleFonts.nunitoSans(
                                                  color: Color.fromARGB(
                                                      255, 9, 9, 9),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15)));
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        taille = newValue.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  "Morphologie",
                                  style: GoogleFonts.nunitoSans(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                width: size.width * 0.2,
                                child: DropdownButton(
                                  //size.width * 0.4,
                                  isExpanded: true,
                                  value: morphology,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: morphologys.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                          style: GoogleFonts.nunitoSans(
                                              color: Color.fromARGB(
                                                  255, 23, 23, 23),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15)),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      morphology = newValue.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: GridView.builder(
                          itemCount: filtre.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            var offer = (filtre as List<Offre>)[index];
                            return ItemCard(
                              offerId: offer.id,
                              height: size.height * 0.3,
                              width: size.width * 0.2,
                              img: offer.image,
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
                                          offer.id,
                                          offer.userId,
                                          offer.image,
                                          offer.title,
                                          offer.cost,
                                          offer.description,
                                          "30 reviews",
                                          "4,5")),
                                );
                              },
                            );
                          }),
                    ),
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
