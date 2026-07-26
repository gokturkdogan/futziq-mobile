import '../../domain/entities/game_family.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<GameFamily>> getGameFamilies() async {
    final models = await remoteDataSource.getGameFamilies();
    return models;
  }
}
