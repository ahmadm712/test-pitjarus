import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:pitjarus_test/helpers/db_helper.dart';
import 'package:pitjarus_test/services/api_services.dart';
import 'package:pitjarus_test/services/db_services.dart';
import 'package:pitjarus_test/utils/failure.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login() async {
    try {
      emit(AuthLoading());
      final data = await ApiServices().login();
      print(data.stores!.length);
      data.stores!.map((store) async => await DatabasesHelper()
          .insertStores(store)
          .then((value) => log('Succes')));
      // await DatabasesHelper().insertStoress(data);

      emit(AuthSuccess(storeListResponse: data));
    } on ServerFailure catch (e) {
      emit(AuthFail(errorMessage: e.message));
    }
  }
}
