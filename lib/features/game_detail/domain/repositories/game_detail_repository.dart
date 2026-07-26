import '../../domain/entities/game_detail.dart';

abstract class GameDetailRepository {
  Future<GameDetail> getGameDetail(String familyCode);
}
