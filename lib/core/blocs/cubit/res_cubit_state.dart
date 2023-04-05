part of 'res_cubit_cubit.dart';

abstract class ResState extends Equatable {
  const ResState();

  @override
  List<Object> get props => [];
}

class ResInitial extends ResState {}

class ResLoading extends ResState {
  @override
  List<Object> get props => [];
}

class ResSuccess extends ResState {
  final List<RestaurantData> restaurant;

  const ResSuccess(this.restaurant);
  @override
  List<Object> get props => [restaurant];
}

class ResError extends ResState {
  const ResError({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
  @override
  String toString() => ' ResError { error: $error }';
}
