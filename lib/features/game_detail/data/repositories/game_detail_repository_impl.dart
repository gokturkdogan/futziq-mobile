import '../../domain/entities/game_detail.dart';
import '../../domain/repositories/game_detail_repository.dart';
import '../datasources/game_detail_remote_data_source.dart';

class GameDetailRepositoryImpl implements GameDetailRepository {
  final GameDetailRemoteDataSource remoteDataSource;

  GameDetailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<GameDetail> getGameDetail(String familyCode) async {
    return await remoteDataSource.getGameDetail(familyCode);
  }
}
