import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchViaCity extends StatefulWidget {
  @override
  _SearchViaCityState createState() => _SearchViaCityState();
}

class _SearchViaCityState extends State<SearchViaCity> {
  String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Via City"),
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter city',
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.black),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context, city);
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Get Weather",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
