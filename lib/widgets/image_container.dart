// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:aprender/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  String imagePath, number, textTitle;

  ImageContainer( this.imagePath, this.number, this.textTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height : MediaQuery.of(context).size.height*0.1,
      width : MediaQuery.of(context).size.width*0.29,
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration : BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(16, number),
          ),
          TextWidget(12, textTitle),
        ],
      ),

    );
  }
}