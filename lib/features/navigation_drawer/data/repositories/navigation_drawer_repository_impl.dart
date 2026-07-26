import '../../domain/entities/menu_item_entity.dart';
import '../../domain/repositories/navigation_drawer_repository.dart';
import '../datasources/navigation_drawer_remote_data_source.dart';

class NavigationDrawerRepositoryImpl implements NavigationDrawerRepository {
  final NavigationDrawerRemoteDataSource remoteDataSource;

  NavigationDrawerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MenuItemEntity>> getMenuItems() async {
    return await remoteDataSource.getMenuItems();
  }
}
