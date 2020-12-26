import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(2),
      child: Image.asset(
        activity.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
