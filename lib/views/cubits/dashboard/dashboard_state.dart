part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardLoadingState extends DashboardState {
  @override
  List<Object> get props => [];
}

final class DashboardLoadedState extends DashboardState {
  @override
  List<Object> get props => [];
}

final class DashboardErrorState extends DashboardState {
  final String errorMessage;
  const DashboardErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
