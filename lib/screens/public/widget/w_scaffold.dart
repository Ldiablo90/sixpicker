import 'package:flutter/material.dart';
import 'package:sixpicker/utils/u_size.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({super.key, required this.child, this.isWrap = true});
  final Widget child;
  final bool isWrap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 나와도 위젯이 올라가지 않게 설정
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWrap?BaseSize.basePadding:0),
        child: child,
      ),
    );
  }
}
