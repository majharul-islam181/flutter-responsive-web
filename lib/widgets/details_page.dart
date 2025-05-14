import 'package:flutter/material.dart';
import 'package:responsive/model/place.dart';
import 'package:responsive/widgets/placedetails_page.dart';

class DetailsPage extends StatelessWidget {
  final Place place;
  const DetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.subtitle,
        ),
        centerTitle: true,
      ),
      body: PlaceDetailsPage(place: place),
    );
  }
}
