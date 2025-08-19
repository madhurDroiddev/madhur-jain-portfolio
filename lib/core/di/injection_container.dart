import 'package:get_it/get_it.dart';
import '../../features/portfolio/data/datasources/portfolio_local_datasource.dart';
import '../../features/portfolio/data/repositories/portfolio_repository_impl.dart';
import '../../features/portfolio/domain/repositories/portfolio_repository.dart';
import '../../features/portfolio/domain/usecases/get_portfolio_data.dart';
import '../../features/portfolio/presentation/bloc/portfolio_bloc.dart';
import '../../features/theme/data/datasources/theme_local_datasource.dart';
import '../../features/theme/data/repositories/theme_repository_impl.dart';
import '../../features/theme/domain/repositories/theme_repository.dart';
import '../../features/theme/domain/usecases/get_theme.dart';
import '../../features/theme/domain/usecases/set_theme.dart';
import '../../features/theme/presentation/bloc/theme_bloc.dart';
import '../../features/auth/data/firebase_auth_service.dart';
import '../../features/portfolio/data/datasources/portfolio_remote_datasource.dart';
import '../../features/portfolio/data/bootstrap/portfolio_bootstrap_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => PortfolioBloc(getPortfolioData: sl()),
  );

  sl.registerFactory(
    () => ThemeBloc(
      getTheme: sl(),
      setTheme: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPortfolioData(sl()));
  sl.registerLazySingleton(() => GetTheme(sl()));
  sl.registerLazySingleton(() => SetTheme(sl()));

  // Repository
  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(sl(), sl()),
  );

  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<PortfolioLocalDataSource>(
    () => PortfolioLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<PortfolioRemoteDataSource>(
    () => PortfolioRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<ThemeLocalDataSource>(
    () => ThemeLocalDataSourceImpl(),
  );

  // Services
  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  sl.registerLazySingleton<PortfolioBootstrapService>(
    () => PortfolioBootstrapService(localDataSource: sl()),
  );
}
