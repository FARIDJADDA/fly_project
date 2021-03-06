import 'package:flutter/material.dart';

import '../../models/trip_model.dart';
import '../../models/activity_model.dart';
import '../../widgets/data.dart';

import './widgets/trip_activity_list.dart';
import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';

class CityView extends StatefulWidget {
  showContext({BuildContext context, List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> with WidgetsBindingObserver {
  Trip myTrip;
  int index;
  List<Activity> activities;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    myTrip = Trip(activities: [], city: 'Paris', date: null);
    index = 0;
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    activities = Data.of(context).activities;
  }

  List<Activity> get tripActivities {
    return activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
              primaryColorDark: Colors.teal,
              accentColor: Colors.teal,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
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

  void toggleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
      print(myTrip.activities);
    });
  }

  void deleteTripActivity(id) {
    setState(() {
      myTrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.chevron_left),
        title: Text('Ton voyage de rêve'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: widget.showContext(
          context: context,
          children: <Widget>[
            TripOverview(
              trip: myTrip,
              setDate: setDate,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: activities,
                      // si c'est séléctionné
                      selectedActivities: myTrip.activities,
                      // methode de selection
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Découverte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activitées',
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}
