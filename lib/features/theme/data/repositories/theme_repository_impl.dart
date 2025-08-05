import '../../domain/repositories/theme_repository.dart';
import '../../domain/entities/theme_entity.dart';
import '../datasources/theme_local_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl(this.localDataSource);

  @override
  Future<ThemeEntity> getTheme() async {
    try {
      final isDarkMode = await localDataSource.getTheme();
      return ThemeEntity(isDarkMode: isDarkMode);
    } catch (e) {
      throw Exception('Failed to get theme: $e');
    }
  }

  @override
  Future<void> setTheme(ThemeEntity theme) async {
    try {
      await localDataSource.setTheme(theme.isDarkMode);
    } catch (e) {
      throw Exception('Failed to set theme: $e');
    }
  }
}