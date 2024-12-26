import 'package:flutter/material.dart';

class PickBall extends StatelessWidget {
  const PickBall({super.key, required this.pick});

  final int pick;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                gradient: RadialGradient(
                    center: const Alignment(-0.2, -0.3),
                    colors: [
                      Colors.white.withOpacity(0),
                      pick >= 1 && pick <= 10 ? Colors.yellow.shade700
                      : pick >= 11 && pick <= 20 ? Colors.blueAccent
                      : pick >= 21 && pick <= 30 ? Colors.redAccent
                      : pick >= 31 && pick <= 40 ? Colors.grey
                      : pick >= 41 && pick <= 45 ? Colors.lightGreen
                      : Colors.black
                    ]),
              ),
              child: Center(
                child: Text(
                  "$pick",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 4)
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
