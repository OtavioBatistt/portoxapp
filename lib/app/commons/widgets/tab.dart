import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

const double _sliceSize = 12;

class OxTab extends StatefulWidget {
  const OxTab(
    this.text, {
    required this.isActive,
    required this.onTap,
    super.key,
  });
  final String text;
  final bool isActive;
  final void Function() onTap;

  @override
  State<OxTab> createState() => _OxTabState();
}

class _OxTabState extends State<OxTab> {
  @override
  Widget build(BuildContext context) {
    final content = Container(
      color: widget.isActive ? Ox.colors.blue : null,
      alignment: Alignment.center,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: Ox.fontSizes.ref60,
          fontWeight: Ox.fontWeights.medium,
          color: widget.isActive ? Ox.colors.white : Ox.colors.blue,
        ),
      ),
    );

    if (widget.isActive) {
      return GestureDetector(
        onTap: widget.onTap,
        child: ClipPath(clipper: OxTabClip(), child: content),
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(top: Ox.space.ref20.h),
        child: CustomPaint(
            painter: OxTabPainter(color: Ox.colors.blue), child: content),
      ),
    );
  }
}

class OxTabPainter extends CustomPainter {
  OxTabPainter({
    required this.color,
  });
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final outlinePaint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    var path = Path()
      ..moveTo(0, _sliceSize)
      ..lineTo(0, _sliceSize)
      ..lineTo(_sliceSize, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, outlinePaint);
  }

  @override
  bool shouldRepaint(OxTabPainter oldDelegate) => false;
}

class OxTabClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, _sliceSize)
      ..lineTo(_sliceSize, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
