import 'package:flutter/material.dart';

class PickBox extends StatelessWidget {
  const PickBox({super.key, required this.pick, this.isPick = false});
  final bool isPick;
  final int pick;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isPick ? pick >= 1 && pick <= 10 ? Colors.yellow.shade700
            : pick >= 11 && pick <= 20 ? Colors.blueAccent
            : pick >= 21 && pick <= 30 ? Colors.redAccent
            : pick >= 31 && pick <= 40 ? Colors.grey
            : pick >= 41 && pick <= 45 ? Colors.lightGreen
            : Colors.transparent: Colors.transparent,
          border: Border.all(color: isPick ? pick >= 1 && pick <= 10 ? Colors.yellow.shade700
              : pick >= 11 && pick <= 20 ? Colors.blueAccent
              : pick >= 21 && pick <= 30 ? Colors.redAccent
              : pick >= 31 && pick <= 40 ? Colors.grey
              : pick >= 41 && pick <= 45 ? Colors.lightGreen
              : Colors.grey: Colors.grey)
      ),
      child: Center(
        child: Text(
          "$pick",
          style: TextStyle(
            color: isPick ?Colors.white:Colors.grey,
            fontWeight: isPick ? FontWeight.bold:null,
          ),
        ),
      ),
    );
  }
}
