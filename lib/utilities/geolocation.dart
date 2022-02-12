import 'package:geolocator/geolocator.dart';

class Geolocation {
  double? lat;
  double? lon;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .timeout(const Duration(seconds: 15));
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      throw 'Error when getting geolocation: $e';
    }
  }
}
