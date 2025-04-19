import 'package:flutter/material.dart';
import 'package:onefan_app/common_widgets/race_card.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';

class RaceCalendarScreen extends StatefulWidget {
  const RaceCalendarScreen({super.key});

  @override
  State<RaceCalendarScreen> createState() => _RaceCalendarScreenState();
}

class _RaceCalendarScreenState extends State<RaceCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2025 Race Calendar", style: AppTextStyles.rajdhaniBoldXxl),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: 24,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => const RaceCard(),
      ),
    );
  }
}
