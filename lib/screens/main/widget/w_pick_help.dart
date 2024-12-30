import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/router/router.dart';
import 'package:sixpicker/utils/u_size.dart';

class PickHelp extends StatelessWidget {
  const PickHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.pop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(BaseSize.baseRound)
                ),
                margin: EdgeInsets.symmetric(horizontal: BaseSize.basePadding),
                padding: EdgeInsets.all(BaseSize.basePadding),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SixPicker",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    Text("안녕하세요! 개발을 시작하면 처음 배우는 로또 생성기를 앱으로 만들어 보았습니다. 😊\nPicker Code는 번호를 생성할 때 기준이 되는 값입니다.\nPicker Code만 단독으로 사용할 수도 있으며,\n현재의 년월일시분초를 추가하거나 위도와 경도를 가져와 기준을 생성할 수도 있습니다.\n앱을 재미로 즐겨주시길 바라며, 나중에 광고가 등장할 수도 있으니 양해 부탁드립니다. 😉\n감사합니다!"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
