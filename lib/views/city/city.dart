import 'package:flutter/material.dart';
import 'package:fly_project/views/city/widgets/trip_activity_list.dart';

import '../../models/trip.model.dart';
import '../../models/activity.model.dart';

import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';

import '../../datas/data.dart' as data;

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  Trip myTrip = Trip(activities: [], city: 'Paris', date: DateTime.now());
  int index = 0;

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

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
              child: index == 0
                  ? ActivityList(activities: widget.activities)
                  : TripActtripList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Découverte'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            title: Text('Mes activitées'),
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}
