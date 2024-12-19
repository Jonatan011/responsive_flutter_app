import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter_app/feature/model/place.dart';

class PlaceDetailWidget extends StatelessWidget {
  final Place place;
  const PlaceDetailWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final fontSize = MediaQuery.of(context).size.width * 0.025;

    return LayoutBuilder(
        builder: (_, constraints) => constraints.maxWidth >= 600 ? buildLargeWidget(color, fontSize) : buildSmallWidget(color, fontSize));
  }

  buidlTitle(double fontSize) => Container(
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
                    style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  AutoSizeText(
                    place.subTitle,
                    minFontSize: 12,
                    maxFontSize: 22,
                    style: TextStyle(color: Colors.grey[500], fontSize: fontSize),
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red.shade500,
            ),
            const SizedBox(width: 5),
            const Text("51")
          ],
        ),
      );

  buidlButtons(Color color) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buidlButton(color: color, icon: Icons.call, text: "Call"),
          buidlButton(color: color, icon: Icons.near_me, text: "Route"),
          buidlButton(color: color, icon: Icons.share, text: "Share"),
        ],
      );

  buidlButton({required Color color, required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: color),
          )
        ],
      ),
    );
  }

  buildDescription(double fontSize) => Padding(
        padding: const EdgeInsets.all(8),
        child: AutoSizeText(
          place.description,
          minFontSize: 12,
          maxFontSize: 24,
          style: TextStyle(fontSize: fontSize),
        ),
      );

  buildSmallWidget(Color color, double fontSize) {
    return ListView(
      children: [
        Image.asset(
          place.image,
          height: 320,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        buidlTitle(fontSize),
        buidlButtons(color),
        buildDescription(fontSize),
      ],
    );
  }

  buildLargeWidget(Color color, double fontSize) {
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
                  buidlTitle(fontSize),
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: buidlButtons(color),
                ),
                buildDescription(fontSize),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
