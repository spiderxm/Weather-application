import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen(this.Weather);

  dynamic Weather;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var temp;
  var min;
  var max;
  var feelsLike;
  var humidity;
  var windSpeed;
  String location;
  String description;
  String iconUrl = 'http://openweathermap.org/img/wn/50d@2x.png';
  var visibility;
  DateTime date;
  var day;
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  @override
  void initState() {
    var weather = widget.Weather;
    print(weather);
    setState(() {
      temp = weather['main']['temp'];
      windSpeed = weather['wind']['speed'];
      location = weather['name'];
      visibility = weather['visibility'];
      feelsLike = weather['main']['feels_like'];
      humidity = double.parse(weather['main']['humidity'].toString());
      description = weather['weather'][0]['description'];
      iconUrl = "http://openweathermap.org/img/wn/" +
          weather['weather'][0]['icon'] +
          "@2x.png";
      min = weather['main']['temp_min'];
      max = weather['main']['temp_max'];
      date =
          DateTime.fromMillisecondsSinceEpoch(weather['sys']['sunset'] * 1000);
      day = date.weekday;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
      ),
      backgroundColor: Color(0xfff7f7fa),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          location,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 36),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(date.day.toString() + "-" + date.month.toString() + "-" + date.year.toString(),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Color(0xff5773ff),
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 150,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Image.network(
                                  iconUrl,
                                  color: Colors.white,
                                ),
                                Text(
                                  description,
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xfff6f8ff)),
                                )
                              ])),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                temp.toStringAsFixed(0) + '°',
                                style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xfff6f8ff)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Feels like " +
                                      feelsLike.toStringAsFixed(0) +
                                      '°',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xfff6f8ff)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  days[day],
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xfff6f8ff)),
                                ),
                              )
                            ],
                          )),
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Wind",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ))),
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Humidity",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ))),
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Visibility",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          )))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: Text(
                                windSpeed.toStringAsFixed(1) + " m/s",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: Text(
                                humidity.toString() + "%",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: Text(
                                (visibility / 1000).toStringAsFixed(1) + "km",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.white,
                          child: Center(
                            child: Container(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    "Min",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    min.toStringAsFixed(1) + '°',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.white,
                          child: Center(
                            child: Container(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    "Max",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    max.toStringAsFixed(1) + '°',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.white,
                          child: Center(
                            child: Container(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    "Sunset",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    date.hour.toString() +
                                        ":" +
                                        date.minute.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
