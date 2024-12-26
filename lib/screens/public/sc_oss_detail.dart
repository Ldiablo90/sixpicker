import 'package:flutter/material.dart';
import 'package:sixpicker/oss_licenses.dart';
import 'package:sixpicker/screens/public/widget/w_scaffold.dart';

class OpenSourceDetail extends StatelessWidget {
  const OpenSourceDetail({super.key, required this.package});

  final Package package;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(package.name),
            Text(package.version),
            Text(package.description),
          ],
        ),
      ),
    );
  }
}
