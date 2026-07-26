import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/game_family_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<GameFamilyModel>> getGameFamilies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({Dio? dio}) : dio = dio ?? Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  @override
  Future<List<GameFamilyModel>> getGameFamilies() async {
    try {
      final response = await dio.get('/api/v1/game-families');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => GameFamilyModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load game families. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load game families: $e');
    }
  }
}
