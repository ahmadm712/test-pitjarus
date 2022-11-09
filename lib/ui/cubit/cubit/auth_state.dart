// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final StoreListResponse storeListResponse;
  const AuthSuccess({
    required this.storeListResponse,
  });

  @override
  List<Object> get props => [storeListResponse];
}

class AuthFail extends AuthState {
  final String errorMessage;
  const AuthFail({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
