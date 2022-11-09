// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'location_home_cubit.dart';

abstract class LocationHomeState extends Equatable {
  const LocationHomeState();

  @override
  List<Object> get props => [];
}

class LocationHomeInitial extends LocationHomeState {}

class LocationHomeLoading extends LocationHomeState {}

class LocationHomeSucces extends LocationHomeState {
  Position data;
  LocationHomeSucces({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class LocationHomeFail extends LocationHomeState {}
