
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeatherScreen(weatherData)),
      );

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.grey,
          size: 80,
        ),
      ),
    );
  }
}
