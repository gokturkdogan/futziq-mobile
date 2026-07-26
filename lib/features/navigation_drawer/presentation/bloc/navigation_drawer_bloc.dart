import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_drawer_event.dart';
import 'navigation_drawer_state.dart';
import '../../domain/usecases/get_menu_items.dart';

class NavigationDrawerBloc
    extends Bloc<NavigationDrawerEvent, NavigationDrawerState> {
  final GetMenuItems getMenuItems;

  NavigationDrawerBloc({required this.getMenuItems})
      : super(const NavigationDrawerState()) {
    on<LoadNavigationDrawerData>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadNavigationDrawerData event,
    Emitter<NavigationDrawerState> emit,
  ) async {
    emit(state.copyWith(status: NavigationDrawerStatus.loading));
    try {
      final menuItems = await getMenuItems.call();
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
