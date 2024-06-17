import 'package:flutter/material.dart';
import 'package:musicplayer/components/gradient_container.dart';

class ImageBox extends StatelessWidget {
  final String image;

  const ImageBox({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4)
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4)
          )
        ]
      ),
      padding: const EdgeInsets.all(12),
      child: GradientContainer(imagePath: image),
    );
  }
}
