import 'package:flutter/material.dart';
import 'package:responsive/data/places.dart';
import 'package:responsive/model/place.dart';
import 'package:responsive/widgets/grid_item_widget.dart';

class PlaceGalleryWidget extends StatelessWidget {
  final ValueChanged<Place> onPlaceChanged;
  final bool isHorizontal;
  const PlaceGalleryWidget({super.key,this.isHorizontal = false, required this.onPlaceChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: GridView.count(
          crossAxisCount: isHorizontal ? 1: 2,
          scrollDirection: isHorizontal ? Axis.horizontal :  Axis.vertical,
          children: allPlaces
              .map<Widget>((place) => GridItemWidget(place: place, onPlaceChanged: onPlaceChanged,))
              .toList(),
        ));
  }
}
