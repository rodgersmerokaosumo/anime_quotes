import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class RandomQuoteScreen extends StatelessWidget {
  const RandomQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: SpeedDial(),
      body: CustomScrollView(),
    );
  }
}
