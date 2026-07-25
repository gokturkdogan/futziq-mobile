import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/hero_banner.dart';
import '../widgets/section_title.dart';
import '../widgets/game_mode_card.dart';
import '../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const HomeLoadData()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.selectedLanguage != current.selectedLanguage,
          builder: (context, state) {
            return HomeAppBar(
              selectedLanguage: state.selectedLanguage,
              onLanguageChanged: (lang) {
                context.read<HomeBloc>().add(HomeLanguageChanged(lang));
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 28),
              const HeroBanner(
                title: 'Futbol Bilgini Konuştur',
                subtitle: 'Oyun modunu seç ve hemen oynamaya başla.',
              ),
              const SizedBox(height: 40),
              const SectionTitle(title: 'OYUN MODUNU SEÇ'),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.status == HomeStatus.loading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: CircularProgressIndicator(color: AppColors.gold),
                      ),
                    );
                  }

                  if (state.status == HomeStatus.failure) {
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Bir hata oluştu',
                        style: GoogleFonts.manrope(color: Colors.red),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.gameModes.length,
                    itemBuilder: (context, index) {
                      final mode = state.gameModes[index];
                      return GameModeCard(
                        title: mode.title,
                        description: mode.description,
                        imageUrl: mode.imageUrl,
                        onTap: () {
                          // Handle navigation or action
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
