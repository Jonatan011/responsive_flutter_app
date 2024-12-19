import 'package:flutter/material.dart';
import 'package:responsive_flutter_app/feature/data/places.dart';
import 'package:responsive_flutter_app/feature/model/place.dart';
import 'package:responsive_flutter_app/feature/widgets/grid_item_widget.dart';

class PlaceGalleryWidget extends StatelessWidget {
  final ValueChanged<Place>? onPlaceChanged;
  final bool isHorizontal;
  const PlaceGalleryWidget({super.key, this.onPlaceChanged, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: GridView.count(
        crossAxisCount: isHorizontal ? 1 : 2,
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1 / 1.2,
        children: allPlaces
            .map(
              (element) => GridItemWidget(
                place: element,
                onPlaceChanged: onPlaceChanged,
              ),
            )
            .toList(),
      ),
    );
  }
}
