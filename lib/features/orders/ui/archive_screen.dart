import 'package:flutter/material.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Archive Orders'),
        ),
        body: const Center(
          child: Text('No Archive Orders'),
        ));
  }
}
