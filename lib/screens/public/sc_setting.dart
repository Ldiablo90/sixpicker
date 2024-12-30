import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/router/router.dart';
import 'package:sixpicker/screens/public/widget/w_button_box.dart';
import 'package:sixpicker/screens/public/widget/w_button_fit.dart';
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
              ButtonFit(
                onTap: (){context.pushNamed(PathOSSList.name);},
                child: const ButtonBox("Oss List"),
              )
            ],
          )
        ],
      ),
    );
  }
}
