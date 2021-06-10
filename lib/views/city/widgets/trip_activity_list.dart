import 'package:flutter/material.dart';
import 'package:fly_project/models/activity.model.dart';
import 'package:fly_project/views/city/widgets/trip_activity_card.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  TripActivityList({this.activities, this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var activity = activities[index];
          return TripActivityCard(
            key: ValueKey(activity.id),
            activity: activity,
            deleteTripActivity: deleteTripActivity,
          );
        },
        itemCount: activities.length,
      ),
    );
  }
}
