import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(22.307159, 73.181221),
        zoom: 14.4746,
      ),
    ));
  }
}
