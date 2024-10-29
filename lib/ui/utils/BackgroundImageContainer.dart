import 'package:flutter/material.dart';

import 'image_assets.dart';
class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImagePath.background,
              ),
              fit: BoxFit.cover)),
      child: child,
    );
  }
}