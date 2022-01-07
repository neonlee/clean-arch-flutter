import 'package:flutter_clean_arch/account/data/data_source/create_account_local_data_source.dart';
import 'package:flutter_clean_arch/account/data/data_source/create_account_remote_data_source.dart';
import 'package:flutter_clean_arch/account/data/repositories/create_account_repositories_impl.dart';
import 'package:flutter_clean_arch/account/domain/repositories/create_account_repository.dart';
import 'package:flutter_clean_arch/account/domain/usecases/create_account_use_case.dart';
import 'package:flutter_clean_arch/account/presentation/store/signup_store.dart';
import 'package:flutter_clean_arch/core/network/dio_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => SignupStore(createAccountUseCase: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => CreateAccountUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<CreateAccountRepository>(
    () => CreateAccountRepositoriesImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<CreateAccountRemoteDataSource>(
    () => CreateAccountRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CreateAccountLocalDataSource>(
    () => CreateAccountLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DioClient('url'));
}
