import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:pitjarus_test/services/db_services.dart';

part 'list_store_state.dart';

class ListStoreCubit extends Cubit<ListStoreState> {
  ListStoreCubit() : super(ListStoreInitial());
  void fetchStore() async {
    try {
      emit(ListStoreLoading());
      final data = await getListStore();
      emit(ListStoreHasData(data: data));
    } catch (e) {
      emit(ListStoreFailed(error: e.toString()));
    }
  }
}
