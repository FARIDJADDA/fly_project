import 'package:flutter/material.dart';
import '../../models/activity.model.dart';
import 'widgets/activity_card.dart';
import '../../datas/data.dart' as data;

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
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
    );
  }
}
