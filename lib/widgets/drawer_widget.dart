import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive/data/states.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fontsize = MediaQuery.of(context).size.width * 0.025;
    return ListView.builder(
      itemCount: allStates.length,
      itemBuilder: (context, index) {
        return index == 0
            ? buildHeader(fontsize)
            : buildMenuItem(index, fontsize);
      },
    );
  }

  Widget buildHeader(double fontsize) => DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('images/image1.jpg'), fit: BoxFit.cover)),
      child: Container(
          alignment: AlignmentDirectional.bottomStart,
          child: AutoSizeText(
            'Bangladesh',
            minFontSize: 22,
            maxFontSize: 30,
            style: TextStyle(fontSize: fontsize, color: Colors.white),
          )));

  Widget buildMenuItem(int index, double fontsize) => ListTile(
      leading: const Icon(Icons.location_city),
      title: AutoSizeText(
        allStates[index - 1],
        minFontSize: 18,
        maxFontSize: 28,
        style: TextStyle(fontSize: fontsize),
      ));
}
