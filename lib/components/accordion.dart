import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccordionWidget extends StatefulWidget {
  final String title;
  final String content;
  const AccordionWidget({required this.title, required this.content});

  @override
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(
            widget.title,
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(
                  widget.content,
                  style: GoogleFonts.merriweather(
                      color: Color.fromARGB(255, 23, 23, 23),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ))
            : Container(),
      ]),
    );
  }
}
