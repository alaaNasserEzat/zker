abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final String locationName;

  LocationLoaded(this.locationName);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
