import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/router/router.dart';
import 'package:sixpicker/screens/public/widget/w_scaffold.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){context.pushNamed(PathOSSList.name);},
                child: Container(
                  decoration: const BoxDecoration(),
                  child: const Center(child: Text("Oss List")),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
