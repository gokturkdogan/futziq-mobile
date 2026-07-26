import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_game_detail.dart';
import 'game_detail_event.dart';
import 'game_detail_state.dart';

class GameDetailBloc extends Bloc<GameDetailEvent, GameDetailState> {
  final GetGameDetail getGameDetail;

  GameDetailBloc({required this.getGameDetail}) : super(GameDetailInitial()) {
    on<LoadGameDetail>(_onLoadGameDetail);
  }

  Future<void> _onLoadGameDetail(
    LoadGameDetail event,
    Emitter<GameDetailState> emit,
  ) async {
    emit(GameDetailLoading());
    try {
      final gameDetail = await getGameDetail.call(event.familyCode);
      emit(GameDetailLoaded(gameDetail));
    } catch (e) {
      emit(GameDetailFailure(e.toString()));
    }
  }
}
