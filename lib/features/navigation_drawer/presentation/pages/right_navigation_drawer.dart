import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/datasources/navigation_drawer_remote_data_source.dart';
import '../../data/repositories/navigation_drawer_repository_impl.dart';
import '../../domain/usecases/get_menu_items.dart';
import '../bloc/navigation_drawer_bloc.dart';
import '../bloc/navigation_drawer_event.dart';
import '../bloc/navigation_drawer_state.dart';
import '../widgets/drawer_footer.dart';
import '../widgets/drawer_header.dart';
import '../widgets/drawer_menu_button.dart';

class RightNavigationDrawer extends StatelessWidget {
  final String logoUrl;
  final String footerLogoUrl;

  const RightNavigationDrawer({
    super.key,
    required this.logoUrl,
    required this.footerLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final remoteDataSource = NavigationDrawerRemoteDataSourceImpl();
        final repository = NavigationDrawerRepositoryImpl(
          remoteDataSource: remoteDataSource,
        );
        final useCase = GetMenuItems(repository: repository);

        return NavigationDrawerBloc(
          getMenuItems: useCase,
        )..add(const LoadNavigationDrawerData());
      },
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.72,
        backgroundColor: const Color(0xFF090909),
        elevation: 0,
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeaderWidget(
                logoUrl: logoUrl,
                onClose: () => Navigator.of(context).pop(),
              ),

              /// CONTENT
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    28,
                    24,
                    24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OYUN MODLARI',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFFBFC2C6),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                        ),
                      ),

                      const SizedBox(height: 28),

                      Expanded(
                        child: BlocBuilder<
                            NavigationDrawerBloc,
                            NavigationDrawerState>(
                          builder: (context, state) {
                            if (state.status ==
                                NavigationDrawerStatus.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state.status ==
                                NavigationDrawerStatus.failure) {
                              return Center(
                                child: Text(
                                  state.errorMessage ?? 'Error',
                                ),
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: state.menuItems.length,
                              separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                              itemBuilder: (_, index) {
                                final menuItem =
                                state.menuItems[index];

                                return DrawerMenuButton(
                                  title: menuItem.title,
                                  imageUrl: menuItem.imageUrl,
                                  onTap: () {
                                    // TODO Navigation
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// FOOTER
              DrawerFooter(
                footerLogoUrl: footerLogoUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}