import 'package:aprender/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class IconColumn extends StatelessWidget {

  Icon icon;
  String text;

  IconColumn ( this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( top: 8, left: 20),
      child: Column(
        children: [
          Container(
            child: icon,
          ),
          TextWidget(20, text),
        ],
      ),
    );
  }
}