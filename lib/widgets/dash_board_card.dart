// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:aprender/widgets/container_button.dart';
import 'package:aprender/widgets/image_container.dart';
import 'package:aprender/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashBoardCard extends StatelessWidget {
  int steps;
  double miles, calories, duration;
  DashBoardCard(this.steps, this.miles, this.calories,this.duration);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height*0.5,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          color: Color(0xff1d3768),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    flex : 4,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 150,
                            // color: Colors.red,
                            child: Row(
                              children: [
                                TextWidget(40, steps.toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text('Paused', style: GoogleFonts.aBeeZee(
                                  color: Colors.green,
                                  fontSize: 25,
                                )),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 130,
                  ),
                 
                  Expanded(
                    flex: 1,
                    child: ContainerButton(
                      Icon( Icons.play_arrow, color: Colors.white, size: 50),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                 
                ],
              ),
            ),
            SizedBox(
              height: 30
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearPercentIndicator(
                progressColor: Colors.green,
                animation: true,
                percent: 0.8, 
                lineHeight: 20,
                barRadius: Radius.circular(10),
              ),
            ),
             SizedBox(
              height: 50
            ),
            Row(
                 children: [
                  ImageContainer('assets/image/foto.JPG',miles.toStringAsFixed(3),'Miles' ),
                  ImageContainer('assets/image/foto.JPG',calories.toStringAsFixed(3),'Calorias' ),
                  ImageContainer('assets/image/foto.JPG',duration.toStringAsFixed(3),'Duration' ),
                 ],
            ),
            
          ],
        ),
      ),

    );
  }
}