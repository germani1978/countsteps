// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aprender/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class CircularDay extends StatelessWidget {

  String day;
  double percentage;
  Color colors;

  CircularDay(this.day, this.percentage, this.colors, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         height: MediaQuery.of(context).size.height*0.1,
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 20,
                lineWidth: 5.0,
                animation: true,
                percent: percentage,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: colors,
              ),
              SizedBox(
                height: 10,
              ),
              TextWidget(20, day),
            ],
          ),
          // decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Color(0xff1d3768),
          // ),
      ),
    );
  }
}