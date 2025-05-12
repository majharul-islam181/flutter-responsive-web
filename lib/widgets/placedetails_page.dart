import 'package:flutter/material.dart';
import 'package:responsive/model/place.dart';

class PlaceDetailsPage extends StatelessWidget {
  final Place place;
  const PlaceDetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.red;
    return ListView(
      children: [
        Image.asset(
          place.image,
          height: 320,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        buildTitle(),
        buildButtons(color),
        buildDescription(),
      ],
    );
  }

  Widget buildTitle() => Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.title,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  place.subtitle,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                )
              ],
            )),
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            const SizedBox(
              width: 8,
            ),
            const Text('42')
          ],
        ),
      );

  Widget buildButtons(Color color) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButton(color, Icons.call, "Call"),
          buildButton(color, Icons.near_me, "ROUTE"),
          buildButton(color, Icons.share, "Share"),
        ],
      );
  Widget buildButton(Color color, IconData icon, String lable) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              lable,
              style: TextStyle(fontSize: 12, color: color),
            )
          ],
        ),
      );

  Widget buildDescription() => Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          place.description,
          style: TextStyle(fontSize: 16),
        ),
      );
}
