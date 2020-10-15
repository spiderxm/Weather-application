import 'package:geolocator/geolocator.dart';

class Location {
  Future<Map> getLocationHighAccuracy() async {
    Map location = new Map();
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      location['latitude'] = position.latitude;
      location['longitude'] = position.longitude;
      location['altitude'] = position.altitude;
      location['accuracy'] = position.accuracy;
    } catch (e) {
      location['error'] = e;
    }

    return location;
  }

  Future<Map> getLocationLowAccuracy() async {
    Map location = new Map();
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      location['latitude'] = position.latitude;
      location['longitude'] = position.longitude;
      location['altitude'] = position.altitude;
      location['accuracy'] = position.accuracy;
    } catch (e) {
      location['error'] = e;
    }
    return location;
  }
}
