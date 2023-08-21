import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Screen'),
        elevation: 2,
      ),
      body: const Center(
        child: Text(" Help Screen Coming Soon"),
      ),
    );
  }
}
