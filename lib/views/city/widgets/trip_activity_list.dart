import 'package:flutter/material.dart';
import 'package:fly_project/models/activity.model.dart';

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
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(activity.image),
              ),
              title: Text(activity.name),
              subtitle: Text(activity.city),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.teal,
                ),
                onPressed: () {
                  deleteTripActivity(activity.id);
                },
              ),
            ),
          );
        },
        itemCount: activities.length,
      ),
    );
  }
}
