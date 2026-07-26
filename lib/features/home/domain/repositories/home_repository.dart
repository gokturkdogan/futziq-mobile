import '../entities/game_family.dart';

abstract class HomeRepository {
  Future<List<GameFamily>> getGameFamilies();
}
