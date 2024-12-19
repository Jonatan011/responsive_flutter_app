import 'package:flutter/material.dart';
import 'package:responsive_flutter_app/feature/data/places.dart';
import 'package:responsive_flutter_app/feature/model/place.dart';
import 'package:responsive_flutter_app/feature/widgets/drawer_widget.dart';
import 'package:responsive_flutter_app/feature/widgets/place_detail_widget.dart';
import 'package:responsive_flutter_app/feature/widgets/place_gallery_widget.dart';
import 'package:responsive_flutter_app/feature/widgets/responsive_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Place selectedPlace = allPlaces[0];
  void changePlace(Place place) {
    setState(() {
      selectedPlace = place;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tour app  responsive",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green.shade700,
        ),
        drawer: isMobile
            ? const Drawer(
                child: DrawerWidget(),
              )
            : null,
        body: ResponsiveWidget(
          mobile: buildMobile(),
          tablet: buidlTablet(),
          desktop: buildDesktop(),
        ));
  }

  buildMobile() => Container(
        color: Colors.red,
        child: const PlaceGalleryWidget(
          isHorizontal: false,
        ),
      );

  buidlTablet() => const Row(
        children: [
          Expanded(
            flex: 2,
            child: DrawerWidget(),
          ),
          Expanded(
            flex: 5,
            child: PlaceGalleryWidget(
              isHorizontal: false,
            ),
          )
        ],
      );

  buildDesktop() => Row(
        children: [
          const Expanded(child: DrawerWidget()),
          Expanded(
            flex: 3,
            child: buildBody(),
          )
        ],
      );

  buildBody() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: PlaceGalleryWidget(
              onPlaceChanged: changePlace,
              isHorizontal: true,
            ),
          ),
          Expanded(
            flex: 2,
            child: PlaceDetailWidget(place: selectedPlace),
          ),
        ],
      ),
    );
  }
}
