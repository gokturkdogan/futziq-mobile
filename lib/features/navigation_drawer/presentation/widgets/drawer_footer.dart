import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerFooter extends StatelessWidget {
  final String footerLogoUrl;

  const DrawerFooter({
    super.key,
    required this.footerLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFF202224),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: footerLogoUrl,
          width: 125,
          height: 32,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
