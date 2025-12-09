import 'package:zker/core/errors/error_model.dart';

class LocationPermissionException extends CustomExpetion  {
  
  LocationPermissionException({required super.message});
}

class DeniedForeverException extends CustomExpetion {
 
  DeniedForeverException({required super.message});
}

class GpsException extends CustomExpetion {

  GpsException({required super.message});
}

class CustomExpetion implements Exception {
  final String message;
  CustomExpetion({required this.message});
}

handelexption(e) {
  if (e is LocationPermissionException) {
    return ErrorModel(message: e.message);
  } else if (e is DeniedForeverException) {
    return ErrorModel(message: e.message);
  } else if (e is GpsException) {
    return ErrorModel(message: e.message);
  } else {
    return e.toString();
  }
}