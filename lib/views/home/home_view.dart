import 'package:flutter/material.dart';
import 'package:fly_project/models/city_model.dart';
import 'package:fly_project/views/home/widgets/city_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  List<City> cities = [
    City(name: 'Paris', image: 'assets/images/paris.jpg'),
    City(name: 'Nice', image: 'assets/images/nice.jpg'),
    City(name: 'Alger', image: 'assets/images/alger.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    cities.map((city) => print(city));

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
          children: cities
              .map(
                (city) => CityCard(
                  city: city,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
