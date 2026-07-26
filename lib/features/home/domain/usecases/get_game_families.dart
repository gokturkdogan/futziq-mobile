import '../entities/game_family.dart';
import '../repositories/home_repository.dart';

class GetGameFamilies {
  final HomeRepository repository;

  GetGameFamilies({required this.repository});

  Future<List<GameFamily>> call() async {
    return await repository.getGameFamilies();
  }
}
