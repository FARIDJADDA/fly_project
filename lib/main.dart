import 'package:flutter/material.dart';
import 'views/city/city.dart';
import './widgets/data.dart';

//import 'views/home/home.dart';

main(List<String> args) {
  runApp(LeFaTrip());
}

class LeFaTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.teal[200],
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(fontSize: 30),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                color: Colors.teal,
              ),
            ),
      ),

      debugShowCheckedModeBanner:
          false, // enleve la banière debug en haut à droite de l'ecran
      //home: Home(),
      home: Data(
        child: City(),
      ),
    );
  }
}
