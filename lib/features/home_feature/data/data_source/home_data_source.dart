import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zker/core/services/location_service.dart';
import 'package:zker/features/home_feature/data/models/prayer_time_model.dart';

abstract class HomeDataSource {
  Future<PrayerTimesModel> getPrayerTimes();
  Future<String> getLocationName({required String locale});
}

class HomeDataSourceImpl implements HomeDataSource {
  final LocationService locationService;

  HomeDataSourceImpl({required this.locationService});
  @override
  Future<PrayerTimesModel> getPrayerTimes() async {
    Position position = await locationService.getCurrentLocation();
    final coordinates = Coordinates(position.latitude, position.longitude);

    final DateTime date = DateTime.now();
    CalculationParameters params = CalculationMethodParameters.egyptian()
      ..madhab = Madhab.shafi;
    PrayerTimes prayerTimes = PrayerTimes(
      coordinates: coordinates,
      date: date,
      calculationParameters: params,
      precision: true,
    );

    return PrayerTimesModel.fromAdhan(prayerTimes: prayerTimes);
  }

  @override
  Future<String> getLocationName({required String locale}) async {
    Position position = await locationService.getCurrentLocation();
    final name = await locationService.getLocationName(
      position,
      locale: locale,
    );
    return name;
  }
}
