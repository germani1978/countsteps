// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:aprender/widgets/button_nav.dart';
import 'package:aprender/widgets/container_button.dart';
import 'package:aprender/widgets/daily_average.dart';
import 'package:aprender/widgets/dash_board_card.dart';
import 'package:aprender/widgets/top_text_button.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  double previusDistance = 0.0;
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.hasData) {
              x = snapshot.data.x;
              y = snapshot.data.y;
              z = snapshot.data.z;
              distance = getValue(x, y, z);
              if (distance > 6) {
                steps++;
              }
              calories = calculateCalories(steps);
              duration = calculateDuration(steps);
              miles = calculateMiles(steps);
            }

              return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xff0c1e4e),
                        Color(0xff224a88),
                      ])),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              TopTextButton('Today', true, () {
                                print('Tapped');
                              }),
                              TopTextButton('Plan', false, () {
                                print('Tapped');
                              }),
                              TopTextButton('Daily', false, () {
                                print('Tapped');
                              }),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              ContainerButton(
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DashBoardCard(steps, miles, calories, duration),
                        DailyAverage(),
                      ],
                    ),
                  ),
                )
              ],
            );
        },
      ),
      bottomNavigationBar: ButtonNav(),
    );
  }

  double getValue(double x, double y ,double z )  {
    double magnitude = sqrt(x*x + y*y + z*z);
    getPreviousValue();
    double modDistance = magnitude - previusDistance;  
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue( double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previusDistance = _pref.getDouble('preValue') ?? 0.0;
    });
  }

  double calculateMiles( int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration( int steps) {
    double durationValue = ( steps * 1 ) / 1000;
    return durationValue;
  }

  double calculateCalories( int steps) {
     double caloriesValue = ( steps * 0.0566 );
     return caloriesValue;
  }

}
