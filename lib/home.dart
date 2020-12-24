import 'package:flutter/material.dart';
import 'package:fly_project/city_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {'name': 'Paris', 'image': 'assets/images/paris.jpg'},
    {'name': 'Lyon', 'image': 'assets/images/lyon.jpg'},
    {'name': 'Nice', 'image': 'assets/images/nice.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('LeFaTrip'),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map((city) {
              return CityCard(name: city['name'], image: city['image']);
            })
          ],
        ),
      ),
    );
  }
}
