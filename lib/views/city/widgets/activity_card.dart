import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final Function toggleActivity;

  ActivityCard({this.activity, this.isSelected, this.toggleActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Ink.image(
        image: AssetImage(activity.image),
        fit: BoxFit.cover,
        child: InkWell(onTap: toggleActivity),
      ),
    );
  }
}
