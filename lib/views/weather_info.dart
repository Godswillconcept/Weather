// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/helpers/locator.dart';
import 'package:weather_app/helpers/send_request.dart';
import 'package:weather_app/model/weather.dart';

import '../utils/app_large_text.dart';
import '../utils/app_text.dart';

class WeatherInfo extends StatefulWidget {
  final String weatherPic;
  final String time;
  final String temp;

  const WeatherInfo({
    Key? key,
    required this.weatherPic,
    required this.time,
    required this.temp,
  }) : super(key: key);

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  late Position currentPosition;
  Weather? weather;
  List<Daily>? dailyData;
  List<Hourly>? hourlyData;
  @override
  void initState() {
    super.initState();
    determinePosition().then((Position position) {
      var lat = position.latitude;
      var lon = position.longitude;
      debugPrint('lat- $lat\n lon - $lon');
      get("https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=0089b4971f7ebb1d030ec3058e8b677a")
          .then((response) {
        setState(() {
          weather = Weather.fromJson(response.data);
          dailyData = weather?.daily;
          hourlyData = weather?.hourly;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dailyData!.length,
      itemBuilder: (context, index) {
        return Text('data');
      },
    );
  }
}
