import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/navigation_drawer_bloc.dart';
import '../bloc/navigation_drawer_event.dart';
import '../bloc/navigation_drawer_state.dart';
import '../widgets/drawer_header.dart';
import '../widgets/drawer_menu_button.dart';
import '../widgets/drawer_footer.dart';

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
      create: (context) => NavigationDrawerBloc()..add(const LoadNavigationDrawerData()),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.72,
        backgroundColor: const Color(0xFF090909),
        elevation: 0,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeaderWidget(
                logoUrl: logoUrl,
                onClose: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
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
                      BlocBuilder<NavigationDrawerBloc, NavigationDrawerState>(
                        builder: (context, state) {
                          if (state.status == NavigationDrawerStatus.loading) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (state.status == NavigationDrawerStatus.failure) {
                            return Center(child: Text(state.errorMessage ?? 'Error'));
                          }
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.menuItems.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final menuItem = state.menuItems[index];
                              return DrawerMenuButton(
                                title: menuItem.title,
                                imageUrl: menuItem.imageUrl,
                                onTap: () {
                                  // Handle navigation
                                },
                              );
                            },
                          );
                        },
                      ),
                      const Spacer(),
                      DrawerFooter(footerLogoUrl: footerLogoUrl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
