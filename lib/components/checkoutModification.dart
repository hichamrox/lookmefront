import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/adress.dart';

class CheckouModification extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final List<Adress>? adresses;
  CheckouModification(this.title, this.adresses, this.onPressed);

  @override
  State<CheckouModification> createState() => _CheckouModificationState();
}

class _CheckouModificationState extends State<CheckouModification> {
  late String pAdress;
  @override
  Widget build(BuildContext context) {
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
              Text("adress"),
              Container(
                width: 100,
                child: DropdownButton(
                  //size.width * 0.4,
                  isExpanded: true,
                  value: widget.adresses,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: widget.adresses?.map((items) {
                    return DropdownMenuItem(
                        value: items.adress, child: Text(items.city));
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
