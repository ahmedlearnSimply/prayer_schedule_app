import 'dart:math';

import 'package:geolocator/geolocator.dart';

Future<Position> _getUserLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }
  }

  return await Geolocator.getCurrentPosition();
}

double calculateQiblaDirection(double latitude, double longitude) {
  const double kaabaLat = 21.422487; // Latitude of Kaaba
  const double kaabaLong = 39.826206; // Longitude of Kaaba

  double deltaLong = kaabaLong - longitude;

  double y = sin(degreesToRadians(deltaLong));
  double x = cos(degreesToRadians(latitude)) * tan(degreesToRadians(kaabaLat)) -
      sin(degreesToRadians(latitude)) * cos(degreesToRadians(deltaLong));

  double qiblaDirection = radiansToDegrees(atan2(y, x));
  return (qiblaDirection + 360) % 360; // Normalize to 0-360 degrees
}

double degreesToRadians(double degrees) {
  return degrees * (pi / 180);
}

double radiansToDegrees(double radians) {
  return radians * (180 / pi);
}
