import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_game_families.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGameFamilies getGameFamilies;

  HomeBloc({required this.getGameFamilies}) : super(const HomeState()) {
    on<HomeLoadData>(_onLoadData);
    on<HomeLanguageChanged>(_onLanguageChanged);
  }

  Future<void> _onLoadData(HomeLoadData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final gameFamilies = await getGameFamilies();

      // Sort by sortOrder ascending
      gameFamilies.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      emit(state.copyWith(
        status: HomeStatus.success,
        gameFamilies: gameFamilies,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: 'Oyun modları yüklenemedi. Lütfen tekrar deneyin.',
      ));
    }
  }

  void _onLanguageChanged(HomeLanguageChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedLanguage: event.language));
  }
}
