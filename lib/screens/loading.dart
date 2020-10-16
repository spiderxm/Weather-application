import 'package:climate/utilities/location.dart';
import 'package:climate/utilities/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getData();
  }

  void getData() async {
    Location location = new Location();
    var data = await location.getLocationHighAccuracy();
    String url;
    try {
      url =
          "https://api.openweathermap.org/data/2.5/weather?lat=${data['latitude']}&lon=${data['longitude']}&appid=63644879657c8bb17af64deabc41a81c&units=metric";
      NetworkHelper networkHelper = new NetworkHelper(url);
      var weatherData = await networkHelper.GET();
      url = "https://api.openweathermap.org/data/2.5/onecall?lat=" +
          data['latitude'].toString() +
          "&lon=" +
          data['longitude'].toString() +
          "&exclude=hourly,minutely&appid=63644879657c8bb17af64deabc41a81c&units=metric";
      NetworkHelper networkHelper2 = new NetworkHelper(url);
      var weatherDataWeekly = await networkHelper2.GET();
      var dailyData = weatherDataWeekly['daily'];
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherScreen(weatherData, dailyData)),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Climate",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Getting Weather Information",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SpinKitFadingFour(
            color: Colors.black,
          )
        ],
      )),
    );
  }
}
