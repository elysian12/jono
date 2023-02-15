import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jono/common/constants/app_constants.dart';
import 'package:jono/data/blocs/geolocation/geolocation_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> mapcontroller =
      Completer<GoogleMapController>();

  late String silverMapStyle;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> markers = <Marker>{};

  late double offsetY, offsetX;

  @override
  void initState() {
    _loadMapStyles();
    super.initState();
  }

  Future _loadMapStyles() async {
    silverMapStyle =
        await rootBundle.loadString('assets/map_style/silver.json');
  }

  Future<void> addCustomIcon() async {
    var icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(100, 100)),
      "assets/svgs/blood-drop.png",
    );

    setState(() {
      markerIcon = icon;
    });
  }

  Future<void> addHosipitalMarker() async {
    for (var element in AppConstants.hospitalsList) {
      markers.add(
        Marker(
          markerId:
              MarkerId('Marker${AppConstants.hospitalsList.indexOf(element)}'),
          position: element,
          icon: markerIcon,
          consumeTapEvents: true,
          onTap: () {
            log(element.toJson().toString());
          },
          // infoWindow: InfoWindow(title: 'Hospital $element'),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeolocationBloc, GeolocationState>(
        builder: (context, state) {
          if (state is GeolocationLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GeolocationLoadedState) {
            return Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    onMapCreated: (controller) async {
                      mapcontroller.complete(controller);
                      controller.setMapStyle(silverMapStyle);
                      await addCustomIcon();
                      await addHosipitalMarker();
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        state.position.latitude,
                        state.position.longitude,
                      ),
                      zoom: 14.4746,
                    ),
                    markers: markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
                ),
                Positioned(
                  // top: {offsetY},
                  // left: {offsetX},
                  child: Container(),
                )
              ],
            );
          }
          return const Center(
            child: Text('Something went Wrong !!!!'),
          );
        },
      ),
    );
  }
}
