// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _pickupLatLng;
  LatLng? _destinationLatLng;

  CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(27.65594703211962, 85.32094949667898),
    zoom: 14.4746,
  );

  Future<void> getCurrentLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    _pickupLatLng = LatLng(_locationData.latitude!, _locationData.longitude!);
    _kGooglePlex = CameraPosition(target: _pickupLatLng!, zoom: 14.4746,);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }
////////////////////////////
  void _addMarker(LatLng position) {
    if (_pickupLatLng == null) {
      _pickupLatLng = position;
    } else if (_destinationLatLng == null) {
      _destinationLatLng = position;
    } else {
      // clear existing markers and add new pickup marker
      _pickupLatLng = position;
      _destinationLatLng = null;
    }
    setState(() {});
  }
///////////////////////////////////
Set<Marker> _buildMarkers() {
    final Set<Marker> markers = {};
    if (_pickupLatLng != null) {
      markers.add(Marker(
        markerId: const MarkerId("pickupMarker"),
        position: _pickupLatLng!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    }
    if (_destinationLatLng != null) {
      markers.add(Marker(
        markerId: const MarkerId("destinationMarker"),
        position: _destinationLatLng!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    }
     return markers;
  }
  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: _buildMarkers(),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onTap: (LatLng position) {
            _addMarker(position);
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}

 