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
      width: 144,
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.langSwitchBackground,
        border: Border.all(color: AppColors.langSwitchBorder),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: selectedLanguage == 'TR'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width: 68,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.langSwitchSelected,
                borderRadius: BorderRadius.circular(20),
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
                        fontSize: 14,
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
                        fontSize: 14,
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
