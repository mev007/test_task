import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen(this.title, {super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101113),
      body: Center(child: Text(title)),
    );
  }
}
