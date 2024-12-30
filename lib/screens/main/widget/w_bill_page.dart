import 'package:flutter/material.dart';
import 'package:sixpicker/screens/main/widget/w_pick_ball.dart';
import 'package:sixpicker/screens/main/widget/w_pick_box.dart';
import 'package:sixpicker/utils/u_size.dart';

class BillPage extends StatelessWidget {
  const BillPage({super.key, required this.picks});

  final List<int> picks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26,width: 5),
                borderRadius: BorderRadius.circular(BaseSize.baseRound),
              ),
              padding: EdgeInsets.all(BaseSize.basePaddingFit),
              child: GridView.count(
                crossAxisCount: 7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.5,
                children: List.generate(
                    45,
                    (index) => PickBox(pick: index + 1, isPick: picks.contains(index + 1)),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: BaseSize.basePaddingFit),
          child: Row(
            children: picks
                .map(
                  (data) => Expanded(
                child: Center(
                  child: PickBall(pick: data, radius: 17,),
                ),
              ),
            )
                .toList(),
          ),
        )
      ],
    );
  }
}
