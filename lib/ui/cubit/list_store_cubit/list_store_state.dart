// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_store_cubit.dart';

abstract class ListStoreState extends Equatable {
  const ListStoreState();

  @override
  List<Object> get props => [];
}

class ListStoreInitial extends ListStoreState {}

class ListStoreLoading extends ListStoreState {}

class ListStoreHasData extends ListStoreState {
  List<Store> data;
  ListStoreHasData({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class ListStoreFailed extends ListStoreState {
  String error;
  ListStoreFailed({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
