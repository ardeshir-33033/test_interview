import 'package:get_it/get_it.dart';
import 'package:test_interview/features/my_cases/data/datasource/get_requests_datasource.dart';
import 'package:test_interview/features/my_cases/data/repository/get_requests_repository_impl.dart';
import 'package:test_interview/features/my_cases/domain/repository/get_requests_repository.dart';
import 'package:test_interview/features/my_cases/domain/usecase/get_requests_usecase.dart';
import 'package:test_interview/features/my_cases/presentation/getx/request_controller.dart';

import 'core/network/api.dart';
import 'core/network/network_info.dart';

final locator = GetIt.instance;

void setup() {
  // *----- GetX -----*
  locator.registerLazySingleton<RequestController>(() => RequestController(locator()));

  // *----- UseCase -----*
  locator.registerLazySingleton<GetRequestsUseCase>(
      () => GetRequestsUseCase(locator()));

  // *----- Repository -----*
  locator.registerLazySingleton<GetRequestsRepository>(
      () => GetRequestsRepositoryImpl(locator(), locator()));

  // *----- Data Source -----*
  locator.registerLazySingleton<GetRequestsDataSource>(
      () => GetRequestsDataSourceImpl(locator()));

  // *----- Network Info -----*
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  locator.registerLazySingleton<Api>(() => Api());
}
