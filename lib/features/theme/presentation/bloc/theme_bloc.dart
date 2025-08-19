import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/theme_entity.dart';
import '../../domain/usecases/get_theme.dart';
import '../../domain/usecases/set_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetTheme getTheme;
  final SetTheme setTheme;

  ThemeBloc({
    required this.getTheme,
    required this.setTheme,
  }) : super(ThemeInitial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
  }

  Future<void> _onLoadTheme(
    LoadTheme event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeLoading());

    try {
      final theme = await getTheme();
      emit(ThemeLoaded(theme: theme));
    } catch (e) {
      emit(ThemeError(message: e.toString()));
    }
  }

  Future<void> _onToggleTheme(
    ToggleTheme event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final currentTheme = await getTheme();
      final newTheme = ThemeEntity(isDarkMode: !currentTheme.isDarkMode);

      await setTheme(newTheme);
      emit(ThemeLoaded(theme: newTheme));
    } catch (e) {
      emit(ThemeError(message: e.toString()));
    }
  }
}
