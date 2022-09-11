// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../utils/app_large_text.dart';
import '../utils/app_text.dart';
import '../helpers/locator.dart';
import '../helpers/send_request.dart';
import '../model/weather.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey _formKey = GlobalKey();
  late Position currentPosition;
  Weather? weather;
  Future<void> showSearchDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        final searchController = TextEditingController();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: IconButton(
                            onPressed: () => debugPrint('Search results'),
                            icon: Icon(Icons.search)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    determinePosition().then((Position position) {
      currentPosition = position;
      var lat = position.latitude;
      var lon = position.longitude;
      // debugPrint('lat- ${lat} \n lon- ${lon}');
      get("https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=0089b4971f7ebb1d030ec3058e8b677a")
          .then((Response response) {
        setState(() {
          weather = Weather.fromJson(response.data);
          // print(weather);
          debugPrint('${weather}');
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    debugPrint(
        "Icon: ${weather!.current!.weather![0].icon} \n Weather $weather");
    return Scaffold(
      backgroundColor: Color(0xff141546),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.amber,
          ),
        ),
        title: AppLargeText(
          text: 'Weather Forecast',
          color: Colors.white,
          size: 16.0,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => debugPrint('Open Notifications'),
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
      body: weather == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                //User Greeting begins
                Container(
                  margin: EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: AppText(
                              text: 'Welcome!',
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                          AppLargeText(
                            text: widget.name,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          debugPrint('search');
                          showSearchDialog(context);
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
                //User Ends
                //Today weather display begins
                Container(
                  width: double.maxFinite,
                  height: 200,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 71, 77, 204),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: 'Today',
                              color: Colors.white,
                              size: 18.0,
                            ),
                            AppText(
                              text: DateFormat.yMMMMEEEEd()
                                  .format(DateTime.now()),
                              color: Colors.white.withOpacity(0.8),
                              size: 12.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppLargeText(
                                  text: weather != null
                                      ? (weather!.current!.temp! - 273.15)
                                          .toStringAsFixed(2)
                                      : " loading ",
                                  color: Colors.white,
                                  size: 50,
                                ),
                                AppLargeText(
                                  text: '\u2103',
                                  color: Colors.amber,
                                  size: 24,
                                ),
                              ],
                            ),
                            weather?.current!.weather![0].icon != null
                                ? SizedBox(
                                    width: 100.0,
                                    height: 100.0,
                                    child: Image.network(
                                        weather!.current!.weather![0].icon!),
                                  )
                                : SizedBox(
                                    width: 100.0,
                                    height: 100.0,
                                    child: Image.asset('images.night.jpg'),
                                  )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.amber,
                            ),
                            AppText(
                              text: "${weather!.timezone}",
                              color: Colors.white,
                              size: 12.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Today weather display ends
                //TabBar begins
                TabBar(
                  // indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.white70,
                  labelColor: Colors.amber,
                  isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    Text('Hourly'),
                    Text('Tomorrow'),
                    Text('Next 7 Days'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.white,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.red,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // )
                //TabBar ends
              ],
            ),
    );
  }
}

// todayDate() {
//   var now = DateTime.now();
//   var formatter = DateFormat('dd-MM-yyyy');
//   String formattedTime = DateFormat('kk:mm:a').format(now);
//   String formattedDate = formatter.format(now)
// }