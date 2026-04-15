part of 'utility_cubit.dart';

sealed class UtilityState extends Equatable {
  const UtilityState();

  @override
  List<Object> get props => [];
}

final class UtilityLoadingState extends UtilityState {
  @override
  List<Object> get props => [];
}

final class UtilityLoadedState extends UtilityState {
  @override
  List<Object> get props => [];
}

final class UtilityErrorState extends UtilityState {
  final String errorMessage;
  const UtilityErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
