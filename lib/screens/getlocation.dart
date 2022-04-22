import 'location_screen.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  // Location({@required latitude,@required longitude});

  void getLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
