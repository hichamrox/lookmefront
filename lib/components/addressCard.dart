import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/pages/addAddress.dart';
import 'package:lookmefront/pages/editAddress.dart';

class AddressCard extends StatefulWidget {
  final String name;
  final String address;
  const AddressCard(this.name, this.address, this.onTapIcon);
  final VoidCallback onTapIcon;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromARGB(255, 23, 23, 23);
    }

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text(
              "  Utiliser cette adresse",
              style: GoogleFonts.nunitoSans(
                  color: Color.fromARGB(255, 6, 6, 6),
                  fontWeight: FontWeight.normal,
                  fontSize: 22),
            )
          ],
        ),
        Card(
          child: Container(
            height: size.height * 0.15,
            width: size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.nunitoSans(
                            color: Color.fromARGB(255, 23, 23, 23),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.edit_outlined,
                          size: 33,
                        ),
                        onTap: widget.onTapIcon,
                      )
                    ]),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    widget.address,
                    style: GoogleFonts.nunitoSans(
                        color: Color.fromARGB(255, 81, 80, 80),
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
