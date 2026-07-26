import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const GameSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.manrope(
              color: const Color(0xFFD6B24D),
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: 2.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: GoogleFonts.manrope(
              color: const Color(0xFF8F9399),
              fontWeight: FontWeight.w400,
              fontSize: 13,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
