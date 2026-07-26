import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import 'language_switcher.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedLanguage;
  final Function(String) onLanguageChanged;
  final VoidCallback onMenuPressed;
  final bool showBackButton;

  const HomeAppBar({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.onMenuPressed,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: AppColors.appBarDivider,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: SizedBox(
          height: 72,
          child: Row(
            children: [
              if (showBackButton)
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: AppColors.grey),
                  onPressed: () => Navigator.of(context).pop(),
                  splashRadius: 10,
                ),
              // if (showBackButton) const SizedBox(width: 4),
              CachedNetworkImage(
                imageUrl: AppConstants.cloudinaryLogo,
                width: 125,
                height: 32,
                fit: BoxFit.contain,
                placeholder: (context, url) => const SizedBox(height: 40, width: 160),
                errorWidget: (context, url, error) => const Icon(Icons.sports_soccer, color: AppColors.gold, size: 40),
              ),
              const Spacer(),
              LanguageSwitcher(
                selectedLanguage: selectedLanguage,
                onChanged: onLanguageChanged,
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onMenuPressed,
                icon: const Icon(
                  Icons.menu,
                  size: 24,
                  color: AppColors.grey,
                ),
                splashRadius: 0.1,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
