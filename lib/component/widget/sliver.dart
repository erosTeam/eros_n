import 'package:flutter/material.dart';

import '../../utils/logger.dart';

class SGDelegatePack {
  SGDelegatePack(this.gridDelegate, this.size);
  SliverGridDelegateWithFixedCrossAxisCount gridDelegate;
  Size size;
}

SGDelegatePack sliverGridDelegateWithMaxToCount(
    double width, SliverGridDelegateWithMaxCrossAxisExtent sliverGridDelegate,
    [double extendHeight = 0]) {
  int crossAxisCount = ((width + sliverGridDelegate.crossAxisSpacing) /
          (sliverGridDelegate.maxCrossAxisExtent +
              sliverGridDelegate.crossAxisSpacing))
      .ceil();

  final double usableCrossAxisExtent =
      width - sliverGridDelegate.crossAxisSpacing * (crossAxisCount - 1);
  if (crossAxisCount < 1) {
    crossAxisCount = 1;
  }
  final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
  double childMainAxisExtent =
      childCrossAxisExtent / sliverGridDelegate.childAspectRatio;
  childMainAxisExtent += extendHeight;
  final childAspectRatio = childCrossAxisExtent / childMainAxisExtent;
  return SGDelegatePack(
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: sliverGridDelegate.mainAxisSpacing,
        crossAxisSpacing: sliverGridDelegate.crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      Size(childCrossAxisExtent, childMainAxisExtent));
}
