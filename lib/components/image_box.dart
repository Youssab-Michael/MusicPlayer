import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final Widget? child;

  const ImageBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.outlineVariant,
                blurRadius: 15,
                offset: const Offset(4, 4)),
            BoxShadow(
                color: Theme.of(context).colorScheme.outline,
                blurRadius: 15,
                offset: Offset(-4, -4))
          ]),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
