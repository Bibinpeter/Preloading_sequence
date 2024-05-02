import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const SkeletonContainer._({
    required this.width,
    required this.height,
    required this.borderRadius,
    super.key,
  });

  // ignore: use_key_in_widget_constructors
  const SkeletonContainer.square({
    double width = double.infinity,
    double height = double.infinity,
  }) : this._(width: width, height: height, borderRadius: const BorderRadius.all(Radius.circular(0)));

  // ignore: use_key_in_widget_constructors
  const SkeletonContainer.rounded({
    double width = double.infinity,
    double height = double.infinity,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  // ignore: use_key_in_widget_constructors
  const SkeletonContainer.circular({
    double width = double.infinity,
    double height = double.infinity,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(80)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
        gradientColor: Colors.orange,
        shimmerColor: Colors.red,
        curve: Curves.easeInQuad,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: borderRadius,
          ),
        ),
      );
}
