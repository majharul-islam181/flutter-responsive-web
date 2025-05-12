import 'package:flutter/material.dart';
import 'package:responsive/widgets/responsive_widget.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/place_gallery_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tour App -- Responsive"),
        centerTitle: true,
      ),
      drawer: isMobile
          ? const Drawer(
              child: DrawerWidget(),
            )
          : null,
      body: ResponsiveWidget(
        mobile: buildMobile(),
        tablet: buildTablet(),
        desktop: buildDesktop(),
      ),
    );
  }
}

// Widget buildMobile() =>
//     Container(color: Colors.red, child: Center(child: Text('Mobile Screen')));
Widget buildMobile() => PlaceGalleryWidget();

Widget buildTablet() =>
    Container(color: Colors.blue, child: Center(child: Text('Tablet Screen')));

Widget buildDesktop() => Container(
    color: Colors.orange, child: Center(child: Text('Desktop Screen')));
