import 'package:flutter/material.dart';
import 'package:responsive_flutter_app/feature/data/states.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.025;
    return ListView.builder(
      itemCount: allStates.length + 1,
      itemBuilder: (context, index) {
        return index == 0 ? buildHearder(fontSize) : buildMenuItem(index, fontSize);
      },
    );
  }

  buildHearder(double fontSize) => DrawerHeader(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage("assets/images/image1.jpg"),
          ),
        ),
        child: Container(
          alignment: AlignmentDirectional.bottomStart,
          child: AutoSizeText(
            "Pakistan",
            minFontSize: 22,
            maxFontSize: 30,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ),
      );

  buildMenuItem(int index, double fontSize) => ListTile(
        leading: const Icon(Icons.shopify_rounded),
        title: AutoSizeText(
          allStates[index - 1],
          minFontSize: 18,
          maxFontSize: 28,
          style: TextStyle(fontSize: fontSize),
        ),
      );
}
