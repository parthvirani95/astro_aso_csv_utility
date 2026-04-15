part of 'utility_cubit.dart';

sealed class UtilityState extends Equatable {
  const UtilityState();

  @override
  List<Object> get props => [];
}

final class UtilityDatabaseAccessState extends UtilityState {
  final String databaseAccessMsg;
  const UtilityDatabaseAccessState({required this.databaseAccessMsg});

  @override
  List<Object> get props => [databaseAccessMsg];
}

final class UtilityLoadingState extends UtilityState {
  @override
  List<Object> get props => [];
}

final class UtilityLoadedState extends UtilityState {
  final List<AppListModel> appList;
  const UtilityLoadedState({required this.appList});

  @override
  List<Object> get props => [appList, appList.length];
}

final class UtilityErrorState extends UtilityState {
  final AppError appError;
  const UtilityErrorState({required this.appError});

  @override
  List<Object> get props => [appError];
}
