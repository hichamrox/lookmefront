import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MdpInput extends StatefulWidget {
  MdpInput(this.label, this.width, this.onChanged);
  final String label;
  final ValueChanged<String>? onChanged;
  final double width;

  @override
  State<MdpInput> createState() => _MdpInputState();
}

class _MdpInputState extends State<MdpInput> {
  bool _isObscure = true;
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
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              labelStyle: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            obscureText: _isObscure,
          ),
        ),
      ],
    );
  }
}
