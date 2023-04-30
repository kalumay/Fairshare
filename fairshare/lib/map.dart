// // ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: duplicate_import, unused_import, unused_local_variable, avoid_function_literals_in_foreach_calls

//import 'dart:async';

//import 'package:flutter/material.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';

// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller = Completer();
//   LatLng? widget.pickupLatLng;
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
//       PointLatLng(widget.pickupLatLng!.latitude, widget.pickupLatLng!.longitude),
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

// Future<void> getCurrentLocation() async {
//   Location location = Location();
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   LocationData _locationData;

//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) {
//       return;
//     }
//   }
//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return;
//     }
//   }
//   _locationData = await location.getLocation();
//   widget.pickupLatLng = LatLng(_locationData.latitude!, _locationData.longitude!);
//   _kGooglePlex = CameraPosition(target: widget.pickupLatLng!, zoom: 14.4746,);
//   setState(() {});
// }

//   @override
//   void initState() {
//     getPolyPoints();
//     super.initState();
//     getCurrentLocation();
//   }
// ////////////////////////////
// void _addMarker(LatLng position) {
//   if (widget.pickupLatLng == null) {
//     widget.pickupLatLng = position;
//   } else if (_destinationLatLng == null) {
//     _destinationLatLng = position;
//   } else {
//     // clear existing markers and add new pickup marker
//     widget.pickupLatLng = position;
//     _destinationLatLng = null;
//   }
//    if (widget.pickupLatLng != null && _destinationLatLng != null) {
//   getPolyPoints();
// }
//   setState(() {});
// }
// ///////////////////////////////////
// Set<Marker> _buildMarkers() {
//     final Set<Marker> markers = {};
//     if (widget.pickupLatLng != null) {
//       markers.add(Marker(
//         markerId: const MarkerId("pickupMarker"),
//         position: widget.pickupLatLng!,
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
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as lat;
import 'package:location/location.dart';
import 'rider.dart';
import 'package:geocoding/geocoding.dart';

class MapSample extends StatefulWidget {
  final LatLng pickup;
  final LatLng destination;

  const MapSample({Key? key, required this.pickup, required this.destination})
      : super(key: key);

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late GoogleMapController _controller;
  //final Mode _mode= Mode.overlay;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    log('Lya k vayo yah');
    PolylinePoints polylinePoints = PolylinePoints();
    String googleApiKey = "AIzaSyC1e1LEMoEjOqMBF7QiGYMQa6gfwXdGkTk";

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(widget.pickup.latitude, widget.pickup.longitude),
        PointLatLng(widget.destination.latitude, widget.destination.longitude));

    if (result.points.isNotEmpty) {
      polylineCoordinates.clear();
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  // void _onTap(LatLng latLng) {
  //   if (widget.pickup == null) {
  //     setState(() {
  //       widget.pickup = latLng;
  //     });
  //   } else if (widget.destination == null) {
  //     setState(() {
  //       widget.destination = latLng;
  //       widget.onLocationSelected(widget.pickup, widget.destination);
  //     });
  //   }
  //   getPolyPoints();
  // }
  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MapSample oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);


      getPolyPoints();

      Future.delayed(Duration(milliseconds: 500), () {
        showDialog(
          context: context,
          builder: (context) {
            final distance = lat.Distance();

            // km = 423
            final km = distance.as(
              lat.LengthUnit.Kilometer,
              lat.LatLng(widget.pickup.latitude, widget.pickup.longitude),
              lat.LatLng(
                  widget.destination.latitude, widget.destination.longitude),
            );

            return AlertDialog(
              title: const Text('Distance'),
              content: Text('${km}km'),
            );
          });
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: LatLng(27.65594703211962, 85.32094949667898),
        zoom: 14,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('pickup'),
          position: widget.pickup,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        ),
        Marker(
          markerId: const MarkerId('destination'),
          position: widget.destination,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        //       else {
        //     // clear existing markers and add new pickup marker
        //     widget.pickupLatLng = position;
        //     widget.destinationLatLng = null;
        //   }
        //    if (widget.pickupLatLng != null && _destinationLatLng != null) {
        //   getPolyPoints();
        // }
        //   setState(() {});
      },
      polylines: {
        Polyline(
            polylineId: const PolylineId("route"),
            points: (polylineCoordinates),
            visible: true)
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<GoogleMapController>('_controller', _controller));
  }
}
