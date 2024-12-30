import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/mvvm/view_model/vm_local.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/router/router.dart';
import 'package:sixpicker/screens/public/widget/w_button_box.dart';
import 'package:sixpicker/screens/public/widget/w_button_fit.dart';
import 'package:sixpicker/screens/public/widget/w_button_fit.dart';
import 'package:sixpicker/screens/public/widget/w_button_fit.dart';
import 'package:sixpicker/screens/public/widget/w_scaffold.dart';


class OnBoarding extends ConsumerStatefulWidget {
  const OnBoarding({super.key});

  @override
  ConsumerState createState() => _OnBoardingState();
}

class _OnBoardingState extends ConsumerState<OnBoarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(vmLocal.notifier).locationPermissionCheck(context);
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 10),
                const Text("SixPicker",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900, shadows: [Shadow(blurRadius: 5,offset: Offset(1, 1),color: Colors.grey)])),
                const Spacer(flex: 2),
                Row(
                  children: [
                    ButtonFit(onTap: (){context.push(PathPicker.path);}, child: const ButtonBox("Number Generation")),
                  ],
                ),
                const Spacer(flex: 1),
                Row(
                  children: [
                    ButtonFit(onTap: (){context.push(PathBill.path);}, child: const ButtonBox("lotto bill")),
                  ],
                ),
                const Spacer(flex: 1),
                Row(
                  children: [
                    ButtonFit(onTap: (){context.push(PathSetting.path);}, child: const ButtonBox("setting")),
                  ],
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("developer: lian"),
                Text("mail : ldiablo90@gmail.com"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}