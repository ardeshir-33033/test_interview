import 'dart:math';

import 'package:flutter/material.dart';

class CustomLoadingAnimation extends StatefulWidget {
  const CustomLoadingAnimation({Key? key}) : super(key: key);

  @override
  State<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation>
    with SingleTickerProviderStateMixin {
  final double initialRadius = 30.0;
  double radius = 0.0;

  late AnimationController controller;
  late Animation<double> animationRotation;
  late Animation<double> radiusIn;
  late Animation<double> radiusOut;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    animationRotation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    radiusIn = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.elasticIn)));

    radiusOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.5 && controller.value <= 1.0) {
          radius = radiusIn.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = radiusOut.value * initialRadius;
        }
      });
    });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Stack(
            children: [
              const AnimationCircle(color: Colors.grey, radius: 30.0),
              for (int i = 0; i < 8; i++)
                Transform.translate(
                    offset: Offset(
                        radius * cos(i * pi / 4), radius * sin(i * pi / 4)),
                    child:
                    const AnimationCircle(color: Colors.red, radius: 5.0)),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimationCircle extends StatelessWidget {
  const AnimationCircle({Key? key, required this.color, required this.radius})
      : super(key: key);

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
