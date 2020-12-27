import 'package:flutter/material.dart';
import 'package:fly_project/views/city/widgets/trip_overview.dart';
import '../../models/trip.model.dart';

import '../../models/activity.model.dart';
import 'widgets/activity_card.dart';
import '../../datas/data.dart' as data;

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  Trip myTrip = Trip(activities: [], city: 'Paris', date: DateTime.now());

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        leading: Icon(Icons.chevron_left),
        title: Text('Organise ton voygae'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(
              trip: myTrip,
              setDate: setDate,
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                crossAxisCount: 2,
                children: widget.activities
                    .map((activity) => ActivityCard(
                          activity: activity,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
