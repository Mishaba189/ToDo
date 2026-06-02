import 'package:flutter/material.dart';

Widget banner(
    String message,
    Color color,
    Icon icon,
    ) {
  return Positioned(
    bottom: 60,
    left: 16,
    right: 16,
    child: Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


void showBannerOverlay(
    BuildContext context,
    String message,
    Color color,
    Icon icon,
    ) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (_) => banner(
      message,
      color,
      icon,
    ),
  );

  overlay.insert(entry);

  Future.delayed(
    const Duration(seconds: 3),
        () => entry.remove(),
  );
}