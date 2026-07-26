import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/menu_item_model.dart';

abstract class NavigationDrawerRemoteDataSource {
  Future<List<MenuItemModel>> getMenuItems();
}

class NavigationDrawerRemoteDataSourceImpl implements NavigationDrawerRemoteDataSource {
  final Dio dio;

  NavigationDrawerRemoteDataSourceImpl({Dio? dio}) : dio = dio ?? Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  @override
  Future<List<MenuItemModel>> getMenuItems() async {
    try {
      final response = await dio.get('/api/v1/game-families');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => MenuItemModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load menu items. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load menu items: $e');
    }
  }
}
