// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }
  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2),
      'images/nitk_b.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(13.011936791159389, 74.79613448318204),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'NITK',
            snippet: 'National Institute of Technology Karnataka Surathkal'
          )
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(13.011936791159389, 74.79613448318204),
          zoom: 15,
        ),
      ),
    );
  }
}
