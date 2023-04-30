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
