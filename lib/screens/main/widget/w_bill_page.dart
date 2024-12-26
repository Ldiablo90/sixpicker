import 'package:flutter/material.dart';
import 'package:sixpicker/screens/main/widget/w_pick_ball.dart';
import 'package:sixpicker/screens/main/widget/w_pick_box.dart';

class BillPage extends StatelessWidget {
  const BillPage({super.key, required this.picks});

  final List<int> picks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
        const Spacer(),
        Row(
          children: picks
              .map(
                (data) => Expanded(
              child: Center(
                child: PickBall(pick: data),
              ),
            ),
          )
              .toList(),
        )
      ],
    );
  }
}
