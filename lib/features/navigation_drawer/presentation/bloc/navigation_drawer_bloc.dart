import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_drawer_event.dart';
import 'navigation_drawer_state.dart';
import '../../domain/entities/menu_item_entity.dart';

class NavigationDrawerBloc
    extends Bloc<NavigationDrawerEvent, NavigationDrawerState> {
  NavigationDrawerBloc() : super(const NavigationDrawerState()) {
    on<LoadNavigationDrawerData>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadNavigationDrawerData event,
    Emitter<NavigationDrawerState> emit,
  ) async {
    emit(state.copyWith(status: NavigationDrawerStatus.loading));
    try {
      // In a real app, you would fetch this from a repository
      final menuItems = [
        const MenuItemEntity(title: 'Hedef Avı', imageUrl: ''),
        const MenuItemEntity(title: 'Kadro Kur', imageUrl: ''),
      ];
      emit(state.copyWith(
        status: NavigationDrawerStatus.success,
        menuItems: menuItems,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: NavigationDrawerStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
