import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation ;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation:slidingAnimation ,
        builder: (context , _){
          return SlideTransition(
              position: slidingAnimation,
              child: const Text(
                "Make Yor Tasks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ));
        });
  }
}
