import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/get_portfolio_data.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetPortfolioData getPortfolioData;

  PortfolioBloc({required this.getPortfolioData}) : super(PortfolioInitial()) {
    on<LoadPortfolio>(_onLoadPortfolio);
  }

  Future<void> _onLoadPortfolio(
    LoadPortfolio event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(PortfolioLoading());

    try {
      final portfolioData = await getPortfolioData();

      emit(PortfolioLoaded(
        experiences: portfolioData['experiences'] as List<Experience>,
        skills: portfolioData['skills'] as List<Skill>,
        projects: portfolioData['projects'] as List<Project>,
        summary: portfolioData['summary'] as String,
        contactInfo: portfolioData['contactInfo'] as Map<String, String>,
      ));
    } catch (e) {
      emit(PortfolioError(message: e.toString()));
    }
  }
}
