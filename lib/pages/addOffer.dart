import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/filePcker.dart';
import 'package:lookmefront/pages/profile.dart';

import '../components/formInput.dart';

class AddOfferPage extends StatefulWidget {
  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
  late String title;
  late String description;
  late String cost;
  late String size1;
  late String category;
  late String morphology;
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
                "Taille",
                size.width * 0.8,
                (value) {
                  setState(() {
                    size1 = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormInput(
                "Morphologie",
                size.width * 0.8,
                (value) {
                  // print(description);
                  setState(() {
                    morphology = value;
                  });
                },
              ),
            ),
            FilesPicker()
          ],
        ));
  }
}
