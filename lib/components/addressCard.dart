import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/pages/addAddress.dart';
import 'package:lookmefront/pages/editAddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressCard extends StatefulWidget {
  final String city;
  final String address;
  final String cp;
  AddressCard(this.city, this.address, this.cp, this.onTapIcon);
  final VoidCallback onTapIcon;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  setAdress(adress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('adress', adress);
  }

  removeAdress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("adress");
  }

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
                        widget.city,
                        style: GoogleFonts.nunitoSans(
                            color: Color.fromARGB(255, 23, 23, 23),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.delete_forever_outlined,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.address,
                        style: GoogleFonts.nunitoSans(
                            color: Color.fromARGB(255, 81, 80, 80),
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                      Text(
                        widget.cp,
                        style: GoogleFonts.nunitoSans(
                            color: Color.fromARGB(255, 81, 80, 80),
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                    ],
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
