import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatefulWidget {
  const CartCard(this.img, this.label, this.price);
  final String img;
  final String label;
  final String price;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int jr = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ClipRRect(
              child: Image.asset(widget.img, scale: 1.7),
              borderRadius: new BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.nunitoSans(
                      color: Color.fromARGB(255, 87, 86, 86),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Text(
                  widget.price + " €",
                  style: GoogleFonts.merriweather(
                      color: Color.fromARGB(255, 8, 8, 8),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          jr = jr + 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 223, 223, 223),
                              borderRadius: BorderRadius.all(Radius.circular(
                                      5.0) //                 <--- border radius here
                                  )),
                          height: 30,
                          width: 30,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(jr.toString(),
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25)),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (jr > 0) {
                            jr = jr - 1;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 223, 223, 223),
                              borderRadius: BorderRadius.all(Radius.circular(
                                      5.0) //                 <--- border radius here
                                  )),
                          height: 30,
                          width: 30,
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  shape: BoxShape.circle),
              child: Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
