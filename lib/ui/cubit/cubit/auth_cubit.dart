import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:pitjarus_test/services/api_services.dart';
import 'package:pitjarus_test/utils/failure.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  List<Marker> markers = [];
  List<Store> stores = [];
  void setVisited({
    required int index,
    required bool val,
  }) {
    stores[index].isVisited = val;
  }

  void login({required String username, required String password}) async {
    try {
      emit(AuthLoading());
      final data =
          await ApiServices().login(username: username, password: password);

      for (var element in data.stores!) {
        markers.add(
          Marker(
            point: LatLng(double.parse(element.latitude!),
                double.parse(element.longitude!)),
            builder: (context) => const Icon(
              Icons.location_on,
              color: Colors.green,
              size: 15,
            ),
          ),
        );
        stores.add(element);
      }
      emit(AuthSuccess(storeListResponse: data));
    } on ServerFailure catch (e) {
      emit(AuthFail(errorMessage: e.message));
    }
  }

  void logout() {
    emit(AuthLoading());
    markers.clear();
    stores.clear();
    emit(AuthInitial());
  }
}
