part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();
  
  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<Experience> experiences;
  final List<Skill> skills;
  final List<Project> projects;
  final String summary;
  final Map<String, String> contactInfo;

  const PortfolioLoaded({
    required this.experiences,
    required this.skills,
    required this.projects,
    required this.summary,
    required this.contactInfo,
  });

  @override
  List<Object> get props => [experiences, skills, projects, summary, contactInfo];
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError({required this.message});

  @override
  List<Object> get props => [message];
}