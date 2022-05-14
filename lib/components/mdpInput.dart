import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MdpInput extends StatefulWidget {
  MdpInput(
      this.label, this.width, this.onChanged, this.obscureText, this.onTap);
  final String label;
  final ValueChanged<String>? onChanged;
  final double width;
  final bool obscureText;
  final VoidCallback onTap;

  @override
  State<MdpInput> createState() => _MdpInputState();
}

class _MdpInputState extends State<MdpInput> {
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
            obscureText: widget.obscureText,
          ),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Image.asset(
            "assets/images/eye.png",
            height: 100,
          ),
        )
      ],
    );
  }
}
