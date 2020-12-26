import 'package:flutter/material.dart';
import 'package:fly_project/models/trip.model.dart';
import 'package:intl/intl.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat("d/M/y ").format(myTrip.date),
                        ),
                      ),
                      RaisedButton(
                        child: Text('Selectionner date'),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
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
