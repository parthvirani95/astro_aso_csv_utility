// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedIndicator extends StatefulWidget {
  final bool isFetching; // Control animation state
  final double? size;
  const AnimatedIndicator({super.key, required this.isFetching, this.size});

  @override
  _AnimatedIndicatorState createState() => _AnimatedIndicatorState();
}

class _AnimatedIndicatorState extends State<AnimatedIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 0.1), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: -0.1), weight: 40),
      TweenSequenceItem(tween: Tween(begin: -0.1, end: 0), weight: 40),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isFetching) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFetching) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value * pi,
          child: SvgPicture.asset(
            "assets/svgs/loading_indicator.svg", // Your SVG file
            width: widget.size ?? 18.r,
            height: widget.size ?? 18.r,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        );
      },
    );
  }
}
