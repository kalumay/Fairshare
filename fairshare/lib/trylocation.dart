// ignore_for_file: unused_field, library_private_types_in_public_api, unused_element, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class Searches extends StatefulWidget {
  final Function(String) onSearch;

  const Searches({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchesState createState() => _SearchesState();
}

class _SearchesState extends State<Searches> {
  String _searchText = '';
  final List<String> _searchResults = [];
  final _places = GoogleMapsPlaces(apiKey: 'AIzaSyC1e1LEMoEjOqMBF7QiGYMQa6gfwXdGkTk');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: Column(
          children: [
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                hintText: 'Search Location',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            
              onSubmitted: (value) {
                _onSearch(value);
              },
            ),
            ElevatedButton(
          onPressed: () async {
            // show input autocomplete with selected mode
            // then get the Prediction selected
            var kGoogleApiKey='AIzaSyC1e1LEMoEjOqMBF7QiGYMQa6gfwXdGkTk';
            Prediction? p = await PlacesAutocomplete.show(
                context: context, apiKey: kGoogleApiKey);
            displayPrediction(p!);
          },
          child: const Text('Find address'),

        ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_searchResults[index]),
                    onTap: () {
                      // Handle selecting a sea\rch result
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
Future<void> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
     await _places.getDetailsByPlaceId(p.placeId ?? '');

      var placeId = p.placeId;
      double lat = detail.result.geometry!.location.lat;
      double lng = detail.result.geometry!.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description ?? '');

      print(lat);
      print(lng);
    }
  }
  void _onSearch(String searchText) async {
    final result = await _places.searchByText(searchText);
    setState(() {
      _searchResults.clear();
      _searchResults.addAll(result.results.map((r) => r.name));
    });
  }
}
