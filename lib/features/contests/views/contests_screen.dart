import 'package:flutter/material.dart';

class ConstestsScreen extends StatefulWidget {
  const ConstestsScreen({super.key});

  @override
  State<ConstestsScreen> createState() => _ConstestsScreenState();
}

class _ConstestsScreenState extends State<ConstestsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Contest Screen"),
      ),
    );
  }
}
