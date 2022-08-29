// ignore_for_file: prefer_const_constructors

import 'package:aprender/widgets/dayCount.dart';
import 'package:aprender/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class DailyAverage extends StatelessWidget {
  const DailyAverage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height*0.23,
        width : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff1d3768),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(20, 'Daily Average :')
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(height: 10,),
                  CircularDay( "S", 0.7, Colors.red  ),
                  CircularDay( "M", 0.1, Colors.cyan  ),
                  CircularDay( "TU", 0.2, Colors.teal  ),
                  CircularDay( "W", 0.3, Colors.amber  ),
                  CircularDay( "TH", 0.4, Colors.green  ),
                  CircularDay( "FRI", 0.5, Colors.indigo  ),
                  CircularDay( "SAT", 0.6, Colors.purple  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}