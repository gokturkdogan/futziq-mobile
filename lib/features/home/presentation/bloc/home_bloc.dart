import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeLoadData>(_onLoadData);
    on<HomeLanguageChanged>(_onLanguageChanged);
  }

  void _onLoadData(HomeLoadData event, Emitter<HomeState> emit) {
    emit(state.copyWith(status: HomeStatus.loading));
    
    // Simulating data load
    final gameModes = [
      const GameModeModel(
        title: 'HEDEF AVI',
        description: 'Hedef değere en yakın toplamı oluşturmak için oyuncu seç.',
        imageUrl: 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=800&auto=format&fit=crop',
      ),
      const GameModeModel(
        title: 'KADRO KUR',
        description: 'Formasyona uygun slotlara oyuncu yerleştirerek kadronu oluştur.',
        imageUrl: 'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?q=80&w=800&auto=format&fit=crop',
      ),
    ];

    emit(state.copyWith(
      status: HomeStatus.success,
      gameModes: gameModes,
    ));
  }

  void _onLanguageChanged(HomeLanguageChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedLanguage: event.language));
  }
}
