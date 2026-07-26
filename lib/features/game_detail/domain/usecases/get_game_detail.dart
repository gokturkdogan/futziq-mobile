import '../entities/game_detail.dart';
import '../repositories/game_detail_repository.dart';

class GetGameDetail {
  final GameDetailRepository repository;

  GetGameDetail({required this.repository});

  Future<GameDetail> call(String familyCode) async {
    return await repository.getGameDetail(familyCode);
  }
}
