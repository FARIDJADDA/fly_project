import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final Function setDate;
  final Trip trip;

  double get amount {
    return 0;
  }

  TripOverview({this.setDate, this.trip});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : size.width, //double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Paris',
            style: TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  trip.date != null
                      ? DateFormat('d/M/y').format(trip.date)
                      : "Choisissez une date",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, // background
                  // onPrimary: Colors.red, // foreground
                ),
                child: Text('Selectionner date'),
                onPressed: setDate,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                'Montant / personne :',
                style: TextStyle(fontSize: 20),
              )),
              Text(
                '$amount \€',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
