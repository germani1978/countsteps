
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopTextButton extends StatelessWidget {

  String text;
  bool isActive;
  Function onTap;

  TopTextButton( this.text, this.isActive, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap(),
        child: Container(
          child: Column(
            children: [
              Text(
                text,
                style: GoogleFonts.aBeeZee(
                  color: !isActive ? Colors.white : Colors.green,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Visibility(
                visible: isActive,
                child: Container(
                  height: 3,
                  width: 70,
                  color: Colors.green,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}