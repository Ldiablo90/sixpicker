import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


enum ScreenTransitionType { fade, slide, none }

class CustomScaffoldPage extends CustomTransitionPage {
  CustomScaffoldPage(
      {super.key, required this.mChild, required this.type})
      : super(
      child: mChild,
      transitionsBuilder: (context, animation, secondaryAnimation,
          child) =>
      type == ScreenTransitionType.fade
          ? CustomFadeTransition(animation: animation, child: child)
          : type == ScreenTransitionType.slide
          ? CustomSlideTransition(
          animation: animation, child: child)
          : CustomNoTransition(
          animation: animation, child: child));
  final Widget mChild;
  final ScreenTransitionType type;
}

class CustomSlideTransition extends SlideTransition {
  CustomSlideTransition(
      {super.key, required this.animation, required this.child})
      : super(
      position: animation.drive(
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .chain(
          CurveTween(curve: Curves.ease),
        ),
      ),
      child: child);
  final Animation<double> animation;
  final Widget child;
}

class CustomFadeTransition extends FadeTransition {
  const CustomFadeTransition({
    super.key,
    required this.animation,
    required this.child,
  }) : super(
    opacity: animation,
    child: child,
  );
  final Animation<double> animation;
  final Widget child;
}

class CustomNoTransition extends SlideTransition {
  CustomNoTransition({super.key, required this.animation, required this.child})
      : super(
      position: animation.drive(
        Tween<Offset>(begin: const Offset(0.0, 0.0), end: Offset.zero)
            .chain(
          CurveTween(curve: Curves.ease),
        ),
      ),
      child: child);
  final Animation<double> animation;
  final Widget child;
}