import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/game_detail_model.dart';

abstract class GameDetailRemoteDataSource {
  Future<GameDetailModel> getGameDetail(String familyCode);
}

class GameDetailRemoteDataSourceImpl implements GameDetailRemoteDataSource {
  final Dio dio;

  GameDetailRemoteDataSourceImpl({Dio? dio})
      : dio = dio ?? Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  @override
  Future<GameDetailModel> getGameDetail(String familyCode) async {
    try {
      final response = await dio.get('/api/v1/game-families/$familyCode');

      if (response.statusCode == 200) {
        return GameDetailModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception(
            'Failed to load game detail. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load game detail: $e');
    }
  }
}
