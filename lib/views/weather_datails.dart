// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../utils/app_large_text.dart';
import '../utils/app_text.dart';

import 'weather_info.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1c49),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white54,
          ),
        ),
        title: AppLargeText(
          text: 'London',
          color: Colors.white,
          size: 24.0,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: AppLargeText(
              text: 'C/K',
              color: Colors.white54,
              size: 18.0,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          //First child
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset(
              'images/storm.png',
            ),
          ),
          //Second child
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            alignment: AlignmentDirectional.center,
            child: Text(
              '16',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 70,
                fontWeight: FontWeight.w100,
                color: Colors.white54,
              ),
            ),
          ),
          //Third child
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    AppText(
                      text: 'Sunrise',
                      color: Colors.white,
                      size: 14.0,
                    ),
                    AppLargeText(
                      text: '05:12',
                      color: Colors.white70,
                      size: 14.0,
                    ),
                  ],
                ),
                Column(
                  children: [
                    AppText(
                      text: 'Sunset',
                      color: Colors.white,
                      size: 14.0,
                    ),
                    AppLargeText(
                      text: '20:40',
                      color: Colors.white70,
                      size: 14.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Fourth child
          Container(
            margin: EdgeInsets.all(20.0),
            alignment: AlignmentDirectional.center,
            child: AppLargeText(
              text: 'Good Evening',
              color: Colors.white70,
              size: 18.0,
            ),
          ),
          //Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 2,
              color: Colors.white30,
            ),
          ),
          //Fifth child
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: WeatherInfo(
                  temp: '32',
                  time: '12 AM',
                  weatherPic: 'images/storm.png',
                ),
              ),
            ),
          ),
          //Sixth child
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Change of Rain',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: '30%',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Humidity',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: '57%',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Divider(
                    height: 2,
                    color: Colors.white30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Wind',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: 'ese 4m/s',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Due Point',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: '14',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Divider(
                    height: 2,
                    color: Colors.white30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Precipitation',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: 'Omm',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Pressure',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: '1013hPa',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Divider(
                    height: 2,
                    color: Colors.white30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Visibility',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: '10mi',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'UV Index',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: '0',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Divider(
                    height: 2,
                    color: Colors.white30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Air Quality Index',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: '36',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Air Quality',
                            color: Colors.white,
                            size: 14.0,
                          ),
                          AppLargeText(
                            text: 'Good',
                            color: Colors.white70,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
