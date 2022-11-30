import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocode/geocode.dart';


class WorldCelsius{

  late double lat;
  late double lon;
  String API_KEY = '7ee6bf0c5722329d7b315fcbd6a8a782';
  late int status;

  Future<void> getCurrentLocation(String adress) async {
    GeoCode geoCode = GeoCode();

    try {
      Coordinates coordinates = await geoCode.forwardGeocoding(
          address: adress);

      print("Latitude: ${coordinates.latitude}");
      lat = coordinates.latitude!;
      print("Longitude: ${coordinates.longitude}");
      lon = coordinates.longitude!;
    } catch (e) {
      print(e);
    }
  }

}

