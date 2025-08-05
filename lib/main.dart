import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_constants.dart';
import 'core/di/injection_container.dart' as di;
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/portfolio/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PortfolioBloc>()..add(LoadPortfolio())),
        BlocProvider(create: (_) => di.sl<ThemeBloc>()..add(LoadTheme())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(AppConstants.primaryColor),
                brightness: Brightness.light,
              ),
              scaffoldBackgroundColor: const Color(0xFFf8fafc),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(AppConstants.primaryColor),
                brightness: Brightness.dark,
              ),
              scaffoldBackgroundColor: const Color(0xFF0f172a),
            ),
            themeMode: state is ThemeLoaded && state.theme.isDarkMode 
                ? ThemeMode.dark 
                : ThemeMode.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}