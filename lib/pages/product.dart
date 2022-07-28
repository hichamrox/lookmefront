import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';

class ProductPage extends StatefulWidget {
  ProductPage(this.img, this.label, this.price, this.description, this.review,
      this.stars);
  final String img;
  final String label;
  final int price;
  final String description;
  final String review;
  final String stars;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int jr = 1;
  String filledIcon = "assets/images/Heartb.png";
  String unfilledIcon = "assets/images/Heart.png";
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Container(
                child: ClipRRect(
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(40.0),
                  ),
                  child: Image.asset(
                    widget.img,
                    scale: 0.5,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text(
                widget.label,
                style: GoogleFonts.gelasio(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text((widget.price * jr).toInt().toString() + " €",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      jr = jr + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 50),
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
                  padding: const EdgeInsets.only(top: 10, left: 20),
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
                    padding: const EdgeInsets.only(top: 5, left: 20),
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text("jours",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22)),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 233, 219, 94),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(widget.stars,
                      style: GoogleFonts.nunitoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text("(" + widget.review + ")",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(widget.description,
                  style: GoogleFonts.nunitoSans(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Button("Ajouter au panier", true, true,
                      size.width * 0.7, 50, () {}, 5),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: IconButton(
                      icon: clicked
                          ? Image.asset(filledIcon)
                          : Image.asset(unfilledIcon),
                      onPressed: () {
                        setState(() {
                          clicked = !clicked;
                        });
                      },
                    ))
              ],
            ),
          ],
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pop(
            context,
            // MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: Container(
          height: 50,
          width: 50,
          child: Card(
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
    );
  }
}
