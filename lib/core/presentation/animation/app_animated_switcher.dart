import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AppAnimatedSwitcher extends StatelessWidget {
  const AppAnimatedSwitcher({
    required this.child,
    super.key,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = appDefaultLayoutBuilder,
  });

  const AppAnimatedSwitcher.sliver({
    required this.child,
    super.key,
  })  : transitionBuilder = SliverAnimatedSwitcher.defaultTransitionBuilder,
        layoutBuilder = appDefaultSliverLayoutBuilder;

  final Widget child;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
      child: child,
    );
  }
}

Widget appDefaultSliverLayoutBuilder(
  Widget? currentChild,
  List<Widget> previousChildren,
) {
  return SliverStack(
    positionedAlignment: Alignment.topCenter,
    children: <Widget>[
      ...previousChildren,
      if (currentChild != null) currentChild,
    ],
  );
}

Widget appDefaultLayoutBuilder(
  Widget? currentChild,
  List<Widget> previousChildren,
) {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      ...previousChildren,
      if (currentChild != null) currentChild,
    ],
  );
}
