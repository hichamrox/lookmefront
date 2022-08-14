import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/filePcker.dart';
import 'package:lookmefront/pages/locationList.dart';
import 'package:lookmefront/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/button.dart';
import '../components/formInput.dart';
import '../services/authservices.dart';

class AddOfferPage extends StatefulWidget {
  final userId;
  AddOfferPage(this.userId);
  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
  getStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? image = prefs.getString('image');
    print(image);
    return image;
  }

  var title, description, cost, size1, height, category, morphology;
  List<String> morphologys = ["A", "V", "H", "8"];
  List<String> sizes = ["XS", "S", "M", "L", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Ajouter un article",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormInput(
                "Title",
                size.width * 0.8,
                (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormInput(
                "Description",
                size.width * 0.8,
                (value) {
                  // print(description);
                  setState(() {
                    description = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormInput(
                "Prix",
                size.width * 0.8,
                (value) {
                  setState(() {
                    cost = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormInput(
                "Catégorie",
                size.width * 0.8,
                (value) {
                  setState(() {
                    category = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormInput(
                "Heigth",
                size.width * 0.8,
                (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Taille",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  Container(
                    width: size.width * 0.65,
                    child: DropdownButton(
                      //size.width * 0.4,
                      isExpanded: true,
                      value: size1,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: sizes.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          size1 = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Morphologie",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: DropdownButton(
                      //size.width * 0.4,
                      isExpanded: true,
                      value: morphology,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: morphologys.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          morphology = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            FilesPicker(),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 15, right: 15),
              child: Button(
                  "Sauvegarder l'article", true, true, size.width * 0.8, 50,
                  () async {
                var data = await AuthService().getOffreById(widget.userId);
                AuthService()
                    .addOffer(widget.userId, title, description, cost, size1,
                        morphology, height, category, await getStringToSF())
                    .then((val) {
                  if (val.data['success']) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationListPage(widget.userId),
                      ),
                    );
                  }
                });
              }, 5),
            )
          ],
        ));
  }
}
