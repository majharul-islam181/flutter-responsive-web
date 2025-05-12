import 'package:flutter/material.dart';
import 'package:responsive/widgets/placedetails_page.dart';
import '../model/place.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    required this.place,
    // required this.onPlaceChanged,
    super.key,
  });

  final Place place;
  // final ValueChanged<Place> onPlaceChanged;

  @override
  Widget build(BuildContext context) {
    // final fontSize = MediaQuery.of(context).size.width * 0.025;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PlaceDetailsPage(
                      place: place,
                    ))),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              place.title,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              place.subtitle,
              style: TextStyle(fontSize: 12),
            ),
          ),
          child: Ink.image(image: AssetImage(place.image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
