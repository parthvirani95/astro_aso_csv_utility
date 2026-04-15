import 'package:astro_aso_csv_utility/views/cubits/loading/loading_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final LoadingCubit loadingCubit;
  DashboardCubit({required this.loadingCubit}) : super(DashboardLoadingState());

  void getDashboardData() async {
    emit(DashboardLoadingState());
    try {
      emit(DashboardLoadedState());
    } catch (e) {
      emit(DashboardErrorState(errorMessage: "Something went wrong"));
    }
  }
}
