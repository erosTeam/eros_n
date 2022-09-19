import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({
    super.key,
    required this.child,
    this.blur = true,
    this.sigma = 5.0,
    this.fit = StackFit.expand,
    this.color = Colors.transparent,
  });

  final Widget child;
  final bool blur;
  final double sigma;
  final StackFit fit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: fit,
      children: <Widget>[
        Container(child: child),
        if (blur)
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: sigma,
              sigmaY: sigma,
            ),
            child: ColoredBox(
              color: color,
            ),
          ),
      ],
    );
  }
}
