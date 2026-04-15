import 'package:astro_aso_csv_utility/views/cubits/dashboard/dashboard_cubit.dart';
import 'package:astro_aso_csv_utility/views/cubits/loading/loading_cubit.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {
  //Cubit Dependency

  getItInstance.registerFactory(
    () => DashboardCubit(loadingCubit: getItInstance()),
  );

  //Theme Dependency
  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
}
