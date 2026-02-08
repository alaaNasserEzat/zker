import 'package:zker/features/azkar_feature/data/models/name_allah.dart';

class NameOfAllahState {}
class NameOfAllahInitial extends NameOfAllahState {}
class NameOfAllahLoading extends NameOfAllahState {}

class NameOfAllahLoaded extends NameOfAllahState {
  List<NameAllah> nameAllahList;
  NameOfAllahLoaded({required this.nameAllahList});
}

class NameOfAllahError extends NameOfAllahState {
  String message;
  NameOfAllahError({required this.message});
}