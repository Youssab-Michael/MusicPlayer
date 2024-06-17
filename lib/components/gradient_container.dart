import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class GradientContainer extends StatefulWidget {
  final String imagePath;

  GradientContainer({super.key, required this.imagePath});

  @override
  _GradientContainerState createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  List<Color> _colors = [];

  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  Future<void> _loadColors() async {
    final colors = await getDominantColors(widget.imagePath);
    setState(() {
      _colors = colors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: _colors.isNotEmpty
            ? LinearGradient(
          colors: _colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
      ),
      child: Center(
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}

Future<List<Color>> getDominantColors(String imagePath) async {
  final imageProvider = AssetImage(imagePath);
  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    imageProvider,
    size: const Size(200, 200),
    maximumColorCount: 5,
  );
  return paletteGenerator.colors.toList();
}