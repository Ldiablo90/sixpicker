import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/oss_licenses.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/screens/public/widget/w_scaffold.dart';

class OpenSourceList extends StatelessWidget {
  const OpenSourceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final package = allDependencies[index];
          return ListTile(
            onTap: () => context.pushNamed(PathOSSDetail.name, extra: package),
            title: Text("${package.name} ${package.version}"),
            subtitle: package.description.isNotEmpty
                ? Text(package.description)
                : null,
            trailing: const Icon(Icons.chevron_right),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: allDependencies.length,
      ),
    );
  }
}
