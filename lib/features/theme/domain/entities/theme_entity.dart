import 'package:equatable/equatable.dart';

class ThemeEntity extends Equatable {
  final bool isDarkMode;

  const ThemeEntity({required this.isDarkMode});

  @override
  List<Object?> get props => [isDarkMode];
}
