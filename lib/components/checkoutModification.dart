import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/adress.dart';

class CheckouModification extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final List<Adress> adresses;
  CheckouModification(this.title, this.adresses, this.onPressed);

  @override
  State<CheckouModification> createState() => _CheckouModificationState();
}

class _CheckouModificationState extends State<CheckouModification> {
  late String pAdress = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Adresse",
                  style: GoogleFonts.nunitoSans(
                      color: Color.fromARGB(255, 19, 19, 19),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
              Container(
                width: size.width * 0.5,
                child: DropdownButton(
                  //size.width * 0.4,
                  isExpanded: true,
                  value: pAdress.isNotEmpty ? pAdress : null,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: widget.adresses.map((item) {
                    return DropdownMenuItem(
                        value: item.adress,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: new Text(
                            item.city,
                            style: GoogleFonts.nunitoSans(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                        ));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      pAdress = newValue.toString();
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
