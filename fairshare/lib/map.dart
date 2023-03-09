// // ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: duplicate_import, unused_import

//import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';

// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller = Completer();
//   LatLng? _pickupLatLng;
//   LatLng? _destinationLatLng;
// List<LatLng> polylineCoordinates=[];
// String googleAPIkey = "AIzaSyC1e1LEMoEjOqMBF7QiGYMQa6gfwXdGkTk";
//   CameraPosition _kGooglePlex = const CameraPosition(
//     target: LatLng(27.65594703211962, 85.32094949667898),
//     zoom: 14.4746,
//   );
//    void getPolyPoints() async{
//     PolylinePoints polylinePoints= PolylinePoints();
//     PolylineResult result= await polylinePoints.getRouteBetweenCoordinates(
//       googleAPIkey, 
//       PointLatLng(_pickupLatLng!.latitude, _pickupLatLng!.longitude), 
//       PointLatLng(_destinationLatLng!.latitude, _destinationLatLng!.longitude)
//   );
//    if(result.points.isNotEmpty){
//     for (var point in result.points) {
//       polylineCoordinates.add(
//           LatLng(point.latitude, point.longitude));
//     }
//     setState(() {
      
//     });
//    } }

//   Future<void> getCurrentLocation() async {
//     Location location = Location();
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//     _locationData = await location.getLocation();
//     _pickupLatLng = LatLng(_locationData.latitude!, _locationData.longitude!);
//     _kGooglePlex = CameraPosition(target: _pickupLatLng!, zoom: 14.4746,);
//     setState(() {});
//   }

//   @override
//   void initState() {
//     getPolyPoints();
//     super.initState();
//     getCurrentLocation();
//   }
// ////////////////////////////
//   void _addMarker(LatLng position) {
//     if (_pickupLatLng == null) {
//       _pickupLatLng = position;
//     } else if (_destinationLatLng == null) {
//       _destinationLatLng = position;
//     } else {
//       // clear existing markers and add new pickup marker
//       _pickupLatLng = position;
//       _destinationLatLng = null;
//     }
//      if (_pickupLatLng != null && _destinationLatLng != null) {
//     getPolyPoints();
//   }
//     setState(() {});
//   }
// ///////////////////////////////////
// Set<Marker> _buildMarkers() {
//     final Set<Marker> markers = {};
//     if (_pickupLatLng != null) {
//       markers.add(Marker(
//         markerId: const MarkerId("pickupMarker"),
//         position: _pickupLatLng!,
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       ));
//     }
//     if (_destinationLatLng != null) {
//       markers.add(Marker(
//         markerId: const MarkerId("destinationMarker"),
//         position: _destinationLatLng!,
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       ));
//     }
//      return markers;
//   }
  


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: GoogleMap(
//           mapType: MapType.normal,
//           initialCameraPosition: _kGooglePlex,
//           polylines: {
//             Polyline(polylineId: const PolylineId("route"),
//             points: polylineCoordinates,
//             ),
//           },
//           markers: _buildMarkers(),
//           myLocationButtonEnabled: true,
//           myLocationEnabled: true,
//           onTap: (LatLng position) {
//             _addMarker(position);
//           },
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//         ),
//       ),
//     );
//   }
// }

 import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'rider.dart';

class MapSample extends StatefulWidget {
  final Function(LatLng, LatLng) onLocationSelected;

  const MapSample({Key? key, required this.onLocationSelected}) : super(key: key);

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late GoogleMapController _controller;
  LatLng? _pickup;
  LatLng? _destination;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onTap(LatLng latLng) {
    if (_pickup == null) {
      setState(() {
        _pickup = latLng;
      });
    } else if (_destination == null) {
      setState(() {
        _destination = latLng;
        widget.onLocationSelected(_pickup!, _destination!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      onTap: _onTap,
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.77483, -122.41942),
        zoom: 12,
      ),
      markers: {
        if (_pickup != null) Marker(
          markerId: const MarkerId('pickup'),
          position: _pickup!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        ),
        if (_destination != null) Marker(
          markerId: const MarkerId('destination'),
          position: _destination!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      },
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GoogleMapController>('_controller', _controller));
  }
}