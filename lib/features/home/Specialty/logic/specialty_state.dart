import 'package:grade_project/features/home/Specialty/data/special_data.dart';
abstract class SpecialtyState {}

class SpecialtyInitialState extends SpecialtyState {}

class SpecialtyLoadingState extends SpecialtyState {}

class SpecialtySuccessState extends SpecialtyState {
  final List<Data> specialList;

  SpecialtySuccessState({
    required this.specialList,
  });
}

class SpecialtyErrorState extends SpecialtyState {
  final String errorMessage;

  SpecialtyErrorState({
    required this.errorMessage,
  });
}