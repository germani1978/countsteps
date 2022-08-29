import 'package:aprender/widgets/icon_column.dart';
import 'package:flutter/material.dart';

class ButtonNav extends StatelessWidget {
  const ButtonNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color:const Color(0xff224a88),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(width: 20),
          IconColumn( const Icon(Icons.home, color:Colors.green, size: 35,), 'Home'),
          IconColumn( const Icon(Icons.auto_graph_outlined, color:Colors.green, size: 35,), 'Report'),
          IconColumn( const Icon(Icons.health_and_safety, color:Colors.green, size: 35,), 'Health'),
          IconColumn( const Icon(Icons.settings, color:Colors.green, size: 35,), 'More'),
        ],
      ),
    );
  }
}