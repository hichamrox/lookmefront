import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInput extends StatefulWidget {
  FormInput(
    this.label,
    this.width,
    this.onChanged,
  );
  final String label;
  final ValueChanged<String>? onChanged;
  final double width;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widget.width,
          child: TextField(
            onChanged: widget.onChanged,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
