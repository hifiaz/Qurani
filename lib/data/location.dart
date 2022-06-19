import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationNotifier with ChangeNotifier {
  var location = "Jakarta";

  void locationNow() async {
    List<Placemark> placemark;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    locations = placemark[0].subAdministrativeArea;
  }

  set locations(value) {
    location = value;
    notifyListeners();
  }

  get locations => location;
}
