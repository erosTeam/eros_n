import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({
    super.key,
    required this.child,
    this.blur = true,
    this.sigma = 5.0,
  });

  final Widget child;
  final bool blur;
  final double sigma;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        Container(child: child),
        Offstage(
          offstage: !blur,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: sigma,
              sigmaY: sigma,
            ),
            child: Container(
                // color: Colors.white.withOpacity(0.1),
                ),
          ),
        ),
      ],
    );
  }
}
