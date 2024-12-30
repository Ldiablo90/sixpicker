import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  const ButtonBox(this.text,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: Colors.black54,
          boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(.5, 1),blurRadius: 3)]
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child:  Text(text,style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
