import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zker/core/errors/exptions.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw GpsException(message: "GPS غير مفعل");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionException(message: "تم رفض الصلاحية");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw DeniedForeverException(message: "الصلاحية مرفوضة نهائيًا");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> getLocationName(Position p, {required String locale}) async {
    final geocoding = Geocoding();
    List<Placemark> placemarks = await geocoding.placemarkFromCoordinates(
      p.latitude,
      p.longitude,
      locale: Locale(locale),
    );
    final first = placemarks.first;
    return "${first.country} , ${first.locality}";
  }
}
