import 'package:flutter/material.dart';
import 'package:onefan_app/common_widgets/contest_card.dart';
import 'package:onefan_app/common_widgets/race_card.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/features/race_calendar/model/response/race_details_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              color: AppColors.background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Lights Out to ", style: AppTextStyles.rajdhaniBoldLg.copyWith(color: AppColors.secondary)),
                  Text("1", style: AppTextStyles.rajdhaniBoldLg.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w900)),
                  Text("FAN!", style: AppTextStyles.rajdhaniBoldLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upcoming Race", style: AppTextStyles.rajdhaniSemiBoldLg),
                  const SizedBox(height: 10),
                  // RaceCard(race: races[0]),
                  const SizedBox(height: 20),
                  Text("Live Contest", style: AppTextStyles.rajdhaniSemiBoldLg),
                  const SizedBox(height: 10),
                  ContestCard(
                    grandPrixName: "Saudi Arabian Grand Prix 2025",
                    deadline: DateTime.now().add(const Duration(hours: 2, minutes: 30)),
                  ),
                  const SizedBox(height: 20),
                  LeaderboardWidget(
                    entries: [
                      LeaderboardEntry(playerName: "Aarav Patel", raceName: "Australian GP", points: 78),
                      LeaderboardEntry(playerName: "Nikita Sen", raceName: "Bahrain GP", points: 66),
                      LeaderboardEntry(playerName: "Zayed Khan", raceName: "Saudi Arabian GP", points: 60),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderboardWidget extends StatelessWidget {
  final List<LeaderboardEntry> entries;

  const LeaderboardWidget({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Previous Race Winners",
          style: AppTextStyles.rajdhaniSemiBoldLg,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: entries.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey[200],
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            entry.playerName,
                            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            entry.raceName,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "+${entry.points} pts",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LeaderboardEntry {
  final String playerName;
  final String raceName;
  final int points;

  LeaderboardEntry({
    required this.playerName,
    required this.raceName,
    required this.points,
  });
}
