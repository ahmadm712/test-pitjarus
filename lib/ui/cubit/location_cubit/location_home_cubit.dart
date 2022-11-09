// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'package:pitjarus_test/services/location_services.dart';

part 'location_home_state.dart';

class LocationHomeCubit extends Cubit<LocationHomeState> {
  LocationServices locationServices;
  LocationHomeCubit(
    this.locationServices,
  ) : super(LocationHomeInitial());
  void fetchLocation() async {
    try {
      emit(LocationHomeLoading());
      await locationServices.determinatePosition().then((value) {
        emit(LocationHomeSucces(data: value));
      });
    } catch (e) {
      emit(LocationHomeFail());
    }
  }
}
