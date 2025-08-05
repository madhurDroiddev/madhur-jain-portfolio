import '../repositories/theme_repository.dart';
import '../entities/theme_entity.dart';

class SetTheme {
  final ThemeRepository repository;

  SetTheme(this.repository);

  Future<void> call(ThemeEntity theme) async {
    await repository.setTheme(theme);
  }
}