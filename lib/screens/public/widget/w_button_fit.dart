import 'package:flutter/material.dart';

class ButtonFit extends StatelessWidget {
  const ButtonFit({super.key,this.flex = 1, this.onTap, required this.child});
  final Function()? onTap;
  final Widget child;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(flex: flex, child: GestureDetector(onTap: onTap, child: child));
  }
}
