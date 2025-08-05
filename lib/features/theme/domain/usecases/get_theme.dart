import '../repositories/theme_repository.dart';
import '../entities/theme_entity.dart';

class GetTheme {
  final ThemeRepository repository;

  GetTheme(this.repository);

  Future<ThemeEntity> call() async {
    return await repository.getTheme();
  }
}