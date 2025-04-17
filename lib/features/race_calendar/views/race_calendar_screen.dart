import 'package:flutter/material.dart';

class RaceCalendarScreen extends StatefulWidget {
  const RaceCalendarScreen({super.key});

  @override
  State<RaceCalendarScreen> createState() => _RaceCalendarScreenState();
}

class _RaceCalendarScreenState extends State<RaceCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Race Calendar"),
      ),
    );
  }
}
