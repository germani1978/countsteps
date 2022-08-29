

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  Icon someIcon;
  ContainerButton( this.someIcon );
  @override
  Widget build(BuildContext context) {
    return Container(
            height : MediaQuery.of(context).size.height*0.06,
            width : MediaQuery.of(context).size.width*0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: Colors.lightGreen
            ),
            child: Center(
              child: someIcon
            ),
    );
  }
}