// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../utils/app_large_text.dart';
import '../utils/app_text.dart';

class HourlyWeather extends StatelessWidget {
  final String icon;
  final String temp;
  final String time;
  const HourlyWeather(
      {Key? key, required this.icon, required this.temp, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10.0,
        top: 10.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xff1a1c49),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 70,
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AppText(
                text: time,
                color: Colors.white,
                size: 12,
              ),
            ),
            Row(
              children: [
                AppText(
                  text: temp,
                  color: Colors.white,
                  size: 22.0,
                ),
                AppLargeText(
                  text: '\00B0C',
                  color: Colors.amber,
                  size: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
