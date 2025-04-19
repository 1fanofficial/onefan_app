import 'package:flutter/material.dart';
import 'package:onefan_app/common_widgets/contest_card.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';

class ConstestsScreen extends StatefulWidget {
  const ConstestsScreen({super.key});

  @override
  State<ConstestsScreen> createState() => _ConstestsScreenState();
}

class _ConstestsScreenState extends State<ConstestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Contests", style: AppTextStyles.rajdhaniBoldXxl),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => ContestCard(
          grandPrixName: "Saudi Arabian Grand Prix 2025",
          deadline: DateTime.now().add(const Duration(hours: 2, minutes: 30)),
        ),
      ),
    );
  }
}
