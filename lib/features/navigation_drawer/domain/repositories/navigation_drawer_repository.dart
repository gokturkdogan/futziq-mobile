import '../entities/menu_item_entity.dart';

abstract class NavigationDrawerRepository {
  Future<List<MenuItemEntity>> getMenuItems();
}
