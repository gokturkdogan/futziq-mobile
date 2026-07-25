import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import 'language_switcher.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedLanguage;
  final Function(String) onLanguageChanged;

  const HomeAppBar({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
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
              CachedNetworkImage(
                imageUrl: AppConstants.cloudinaryLogo,
                width: 160,
                height: 40,
                fit: BoxFit.contain,
                placeholder: (context, url) => const SizedBox(height: 40, width: 160),
                errorWidget: (context, url, error) => const Icon(Icons.sports_soccer, color: AppColors.gold, size: 40),
              ),
              const Spacer(),
              LanguageSwitcher(
                selectedLanguage: selectedLanguage,
                onChanged: onLanguageChanged,
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  size: 30,
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
