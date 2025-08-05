import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String name;
  final String category;
  final String description;

  const Skill({
    required this.name,
    required this.category,
    required this.description,
  });

  @override
  List<Object?> get props => [name, category, description];
}