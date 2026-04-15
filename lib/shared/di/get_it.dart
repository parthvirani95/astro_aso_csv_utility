import 'package:astro_aso_csv_utility/views/cubits/utility/utility_cubit.dart';
import 'package:astro_aso_csv_utility/views/cubits/loading/loading_cubit.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {
  //Cubit Dependency

  getItInstance.registerFactory(
    () => UtlityCubit(loadingCubit: getItInstance()),
  );

  //Theme Dependency
  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
}
