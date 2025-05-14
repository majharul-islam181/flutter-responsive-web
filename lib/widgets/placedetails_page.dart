import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive/model/place.dart';

class PlaceDetailsPage extends StatelessWidget {
  final Place place;
  const PlaceDetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.red;
    final fontsize = MediaQuery.of(context).size.width * 0.025;

    return LayoutBuilder(
      builder: (_, constraints) => constraints.maxWidth >= 600
          ? buildLargeWidget(color, fontsize) // Tablet
          : buildSmallWidget(color, fontsize), // Mobile
    );
  }

// this is for mobile
  Widget buildSmallWidget(Color color, double fontSize) {
    return ListView(
      children: [
        Column(
          children: [
            Image.asset(
              place.image,
              height: 320,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            buildTitle(fontSize),
            buildButtons(color),
            buildDescription(fontSize),
          ],
        )
      ],
    );
  }

// this is for tab
  Widget buildLargeWidget(Color color, double fontsize) {
    return SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                Image.asset(
                  place.image,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                buildTitle(fontsize),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: buildButtons(color),
                ),
                buildDescription(fontsize),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(double fontsize) => Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  place.title,
                  minFontSize: 16,
                  maxFontSize: 32,
                  style: TextStyle(
                      fontSize: fontsize, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                AutoSizeText(
                  place.subtitle,
                  minFontSize: 12,
                  maxFontSize: 24,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: fontsize,
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

  Widget buildDescription(double fontsize) => Padding(
      padding: EdgeInsets.all(10),
      child: AutoSizeText(
        place.description,
        minFontSize: 18,
        maxFontSize: 26,
        style: TextStyle(fontSize: fontsize),
      ));
}
