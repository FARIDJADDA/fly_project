import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String name;
  final String image;
  final bool checked;
  final Function updateChecked;

  CityCard({this.name, this.image, this.checked, this.updateChecked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(image),
              child: InkWell(
                onTap: updateChecked,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_border,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  )),
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}