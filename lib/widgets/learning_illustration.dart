import 'package:flutter/material.dart';

class LearningIllustration extends StatelessWidget {
  const LearningIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          Icons.school,
          size: 80,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}