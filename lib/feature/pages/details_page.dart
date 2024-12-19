import 'package:flutter/material.dart';
import 'package:responsive_flutter_app/feature/model/place.dart';
import 'package:responsive_flutter_app/feature/widgets/place_detail_widget.dart';

class DetailsPage extends StatelessWidget {
  final Place place;
  const DetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          place.subTitle,
        ),
      ),
      body: PlaceDetailWidget(place: place),
    );
  }
}
