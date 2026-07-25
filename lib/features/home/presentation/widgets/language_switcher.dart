import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class LanguageSwitcher extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) onChanged;

  const LanguageSwitcher({
    super.key,
    required this.selectedLanguage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.langSwitchBackground,
        border: Border.all(color: AppColors.langSwitchBorder),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(3),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: selectedLanguage == 'TR'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width: 47,
              height: 26,
              decoration: BoxDecoration(
                color: AppColors.langSwitchSelected,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onChanged('TR'),
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Text(
                      'TR',
                      style: GoogleFonts.manrope(
                        color: selectedLanguage == 'TR'
                            ? AppColors.gold
                            : AppColors.subtitle,
                        fontWeight:
                            selectedLanguage == 'TR' ? FontWeight.w700 : FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onChanged('EN'),
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Text(
                      'EN',
                      style: GoogleFonts.manrope(
                        color: selectedLanguage == 'EN'
                            ? AppColors.gold
                            : AppColors.subtitle,
                        fontWeight:
                            selectedLanguage == 'EN' ? FontWeight.w700 : FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
