import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  final String company;
  final String position;
  final String duration;
  final String description;

  const Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
  });

  @override
  List<Object?> get props => [company, position, duration, description];
}
