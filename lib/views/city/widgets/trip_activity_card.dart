// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fly_project/models/activity_model.dart';

class TripActivityCard extends StatefulWidget {
  final Activity activity;
  final Function deleteTripActivity;

  // getColor() {
  //   const colors = [Colors.blue, Colors.red];
  //   return colors[Random().nextInt(2)];
  // }

  TripActivityCard({Key key, this.activity, this.deleteTripActivity})
      : super(key: key);

  @override
  _TripActivityCardState createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(
          widget.activity.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(widget.activity.city),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            widget.deleteTripActivity(widget.activity.id);
          },
        ),
      ),
    );
  }
}
