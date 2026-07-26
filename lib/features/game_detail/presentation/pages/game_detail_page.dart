import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/widgets/home_app_bar.dart';
import '../../../navigation_drawer/presentation/pages/right_navigation_drawer.dart';
import '../../data/datasources/game_detail_remote_data_source.dart';
import '../../data/repositories/game_detail_repository_impl.dart';
import '../../domain/usecases/get_game_detail.dart';
import '../bloc/game_detail_bloc.dart';
import '../bloc/game_detail_event.dart';
import '../bloc/game_detail_state.dart';
import '../widgets/game_detail_header.dart';
import '../widgets/game_grid.dart';
import '../widgets/loading_view.dart';
import '../widgets/error_view.dart';

class GameDetailPage extends StatelessWidget {
  final String familyCode;

  const GameDetailPage({
    super.key,
    required this.familyCode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final remoteDataSource = GameDetailRemoteDataSourceImpl();
        final repository =
            GameDetailRepositoryImpl(remoteDataSource: remoteDataSource);
        final useCase = GetGameDetail(repository: repository);
        return GameDetailBloc(getGameDetail: useCase)
          ..add(LoadGameDetail(familyCode));
      },
      child: GameDetailView(familyCode: familyCode),
    );
  }
}

class GameDetailView extends StatefulWidget {
  final String familyCode;

  const GameDetailView({
    super.key,
    required this.familyCode,
  });

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: HomeAppBar(
          showBackButton: true,
          selectedLanguage: 'TR',
          onLanguageChanged: (lang) {
            // Language change logic if needed
          },
          onMenuPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ),
      endDrawer: const RightNavigationDrawer(
        logoUrl: AppConstants.cloudinaryLogo,
        footerLogoUrl: AppConstants.cloudinaryLogo,
      ),
      body: BlocConsumer<GameDetailBloc, GameDetailState>(
        listener: (context, state) {
          if (state is GameDetailLoaded) {
            _fadeController.forward(from: 0.0);
          }
        },
        builder: (context, state) {
          if (state is GameDetailLoading) {
            return const LoadingView();
          }

          if (state is GameDetailFailure) {
            return ErrorView(
              message: state.message,
              onRetry: () {
                context
                    .read<GameDetailBloc>()
                    .add(LoadGameDetail(widget.familyCode));
              },
            );
          }

          if (state is GameDetailLoaded) {
            final gameDetail = state.gameDetail;
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GameDetailHeader(
                      imageUrl: gameDetail.imageUrl,
                      title: gameDetail.title,
                      description: gameDetail.description,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: AppColors.divider.withOpacity(0.5),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GameGrid(games: gameDetail.games),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
