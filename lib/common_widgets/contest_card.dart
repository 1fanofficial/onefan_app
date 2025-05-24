import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/contests/model/response/contest_response.dart';

class ContestCard extends StatefulWidget {
  final ContestRespone contestDetails;

  const ContestCard({super.key, required this.contestDetails});

  @override
  State<ContestCard> createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {
  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.contestDetails.deadline.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final diff = widget.contestDetails.deadline.difference(DateTime.now());
      if (diff.isNegative) {
        _timer?.cancel();
      }
      setState(() {
        _remaining = diff;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    if (duration.isNegative) return "Deadline passed";

    final days = duration.inDays;
    final hours = (duration.inHours % 24).toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    if (days > 0) {
      return "$days${days == 1 ? ' day' : ' days'}, $hours:$minutes:$seconds";
    } else {
      return "$hours:$minutes:$seconds";
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalSpots = widget.contestDetails.maxEntries;
    int entries = widget.contestDetails.entries;
    int spotsLeft = totalSpots - entries;
    final isFillingFast = spotsLeft < totalSpots * 0.25;
    final spotsFilled = totalSpots == 0 ? 0 : (entries / totalSpots * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.background,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with GP name and timer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side: Contest name & GP
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.contestDetails.contestName,
                          style: AppTextStyles.rajdhaniBoldXl.copyWith(color: AppColors.primary),
                        ),
                        if (isFillingFast) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "HOT",
                              style: AppTextStyles.interBoldXs.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.contestDetails.raceDetails.raceName,
                      style: AppTextStyles.interSemiBoldMd.copyWith(color: AppColors.secondary),
                    ),
                  ],
                ),
              ),

              // Right side: Timer
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.timer, size: 14, color: Colors.redAccent),
                    const SizedBox(width: 4),
                    Text(
                      _formatDuration(_remaining),
                      style: AppTextStyles.interSemiBoldSm.copyWith(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Progress Bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$spotsLeft of $totalSpots spots left",
                    style: AppTextStyles.interNormalSm.copyWith(color: AppColors.secondary),
                  ),
                  Text(
                    "$spotsFilled% filled",
                    style: AppTextStyles.interSemiBoldSm.copyWith(
                      color: isFillingFast ? Colors.redAccent : AppColors.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: totalSpots == 0 ? 0 : (totalSpots - spotsLeft) / totalSpots,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isFillingFast ? Colors.redAccent : AppColors.primary,
                  ),
                  minHeight: 4,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Prize & Entry Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contestInfoTile("🏆 Prize", widget.contestDetails.prizePool.toString()),
              _contestInfoTile("💰 Entry", widget.contestDetails.entryFees.toString()),

              // Join Button (more compact)
              widget.contestDetails.hasJoined
                  ? SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Joined",
                          style: AppTextStyles.interSemiBoldSm.copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pushNamed(RouteName.rankDrivers, extra: widget.contestDetails.raceDetails);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Join Now",
                          style: AppTextStyles.interSemiBoldSm.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contestInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppTextStyles.interNormalSm.copyWith(color: AppColors.secondary),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTextStyles.interSemiBoldMd.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }
}
