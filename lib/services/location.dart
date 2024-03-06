import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  Location(this.latitude, this.longitude);

  Future<void> getCurrentLocation() async {
    // i'm using Future here in other to pass await while calling the method
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
