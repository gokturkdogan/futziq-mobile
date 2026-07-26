import '../entities/menu_item_entity.dart';
import '../repositories/navigation_drawer_repository.dart';

class GetMenuItems {
  final NavigationDrawerRepository repository;

  GetMenuItems({required this.repository});

  Future<List<MenuItemEntity>> call() async {
    return await repository.getMenuItems();
  }
}
