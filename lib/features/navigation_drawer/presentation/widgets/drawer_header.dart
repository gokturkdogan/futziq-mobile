import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerHeaderWidget extends StatefulWidget {
  final String logoUrl;
  final VoidCallback onClose;

  const DrawerHeaderWidget({
    super.key,
    required this.logoUrl,
    required this.onClose,
  });

  @override
  State<DrawerHeaderWidget> createState() => _DrawerHeaderWidgetState();
}

class _DrawerHeaderWidgetState extends State<DrawerHeaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF090909),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF202224),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: widget.logoUrl,
            width: 125,
            height: 32,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          GestureDetector(
            onTapDown: (_) => _controller.forward(),
            onTapUp: (_) => _controller.reverse().then((value) => widget.onClose()),
            onTapCancel: () => _controller.reverse(),
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: const Icon(
                Icons.close,
                size: 20,
                color: Color(0xFFC3C5C8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
