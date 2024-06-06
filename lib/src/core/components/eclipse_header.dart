import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/helper/app_colors.dart';



class EclipseHeader extends StatelessWidget {
  const EclipseHeader({
    super.key,
    this.isBackAllow = false,
    this.height = 100.0
  });
  final bool isBackAllow;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:  Alignment.bottomLeft,
      children: [
       CustomPaint(
         painter: CustomEclipse(),
         child: Container(height: height,),
       ),
        isBackAllow ?
            IconButton(
                onPressed: (){
                  context.router.maybePop();
                },
                icon: const Icon(
                    Icons.arrow_back_sharp,
                  size: 25,
                  color: AppColors.primaryColor,
                )) :
            const SizedBox.shrink()
      ],
    );
  }
}


const double _kCurveHeight = 70;

class CustomEclipse extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo(0, size.height - _kCurveHeight);
    path.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(
        path,
        Paint()
          ..color = AppColors.primaryColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}