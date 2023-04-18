import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AvailableNamesScreen extends StatelessWidget {
  const AvailableNamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: DraggableFab(child: SpeedDial()),
      body: CustomScrollView(),
    );
  }
}
