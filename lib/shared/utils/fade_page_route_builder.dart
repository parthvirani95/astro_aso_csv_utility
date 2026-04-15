import 'package:flutter/material.dart';

class SlidePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  @override
  final RouteSettings settings;

  SlidePageRouteBuilder({
    required this.builder,
    required this.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;

            final tween = Tween<Offset>(
              begin: const Offset(1.0, 0.0), // Start from right
              end: Offset.zero, // End at normal position
            ).chain(CurveTween(curve: curve));

            final reverseTween = Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(-1.0, 0.0), // Exit to the left
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: SlideTransition(
                position: secondaryAnimation.drive(reverseTween),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          settings: settings,
        );
}
