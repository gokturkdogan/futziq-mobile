import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.sectionDivider,
              thickness: 1,
              endIndent: 12,
            ),
          ),
          Text(
            title.toUpperCase(),
            style: GoogleFonts.manrope(
              color: AppColors.gold,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
              fontSize: 14,
            ),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.sectionDivider,
              thickness: 1,
              indent: 12,
            ),
          ),
        ],
      ),
    );
  }
}
