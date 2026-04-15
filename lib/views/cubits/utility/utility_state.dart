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
  final List<AppListModel> selectedApps;
  final List<String> selectedPlatforms;
  final List<String> selectedKeywords;
  final List<String> selectedCountries;
  final int totalCSVRows;
  final int splitCSVMaxRows;

  const UtilityLoadedState({
    required this.appList,
    required this.selectedApps,
    required this.selectedPlatforms,
    required this.selectedKeywords,
    required this.selectedCountries,
    required this.totalCSVRows,
    required this.splitCSVMaxRows,
  });

  @override
  List<Object> get props => [
        appList,
        appList.length,
        selectedApps,
        selectedApps.length,
        selectedPlatforms,
        selectedPlatforms.length,
        selectedKeywords,
        selectedKeywords.length,
        selectedCountries,
        selectedCountries.length,
        totalCSVRows,
        splitCSVMaxRows,
      ];

  UtilityLoadedState copyWith({
    List<AppListModel>? appList,
    List<AppListModel>? selectedApps,
    List<String>? selectedPlatforms,
    List<String>? selectedKeywords,
    List<String>? selectedCountries,
    int? totalCSVRows,
    int? splitCSVMaxRows,
  }) {
    return UtilityLoadedState(
        appList: appList ?? this.appList,
        selectedApps: selectedApps ?? this.selectedApps,
        selectedPlatforms: selectedPlatforms ?? this.selectedPlatforms,
        selectedKeywords: selectedKeywords ?? this.selectedKeywords,
        selectedCountries: selectedCountries ?? this.selectedCountries,
        totalCSVRows: totalCSVRows ?? this.totalCSVRows,
        splitCSVMaxRows: splitCSVMaxRows ?? this.splitCSVMaxRows);
  }
}

final class UtilityErrorState extends UtilityState {
  final AppError appError;
  const UtilityErrorState({required this.appError});

  @override
  List<Object> get props => [appError];
}
