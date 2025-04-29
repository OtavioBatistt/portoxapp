import 'package:flutter/material.dart';

class OxCard extends StatelessWidget {
  const OxCard({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OxCardClip(),
      child: child,
    );
  }
}

class OxCardClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, 24)
      ..lineTo(24, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 24)
      ..lineTo(size.width - 24, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
