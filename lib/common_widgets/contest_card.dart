import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/auth/views/widgets/custom_filled_button.dart';

class ContestCard extends StatefulWidget {
  final String grandPrixName;
  final DateTime deadline;

  const ContestCard({
    super.key,
    required this.grandPrixName,
    required this.deadline,
  });

  @override
  State<ContestCard> createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {
  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.deadline.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final diff = widget.deadline.difference(DateTime.now());
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
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
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
          /// Header with icon and contest name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Contest Name + Grand Prix Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mega Grand Prix Contest",
                    style: AppTextStyles.rajdhaniBoldXl.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.grandPrixName,
                    style: AppTextStyles.interSemiBoldMd.copyWith(color: AppColors.secondary),
                  ),
                ],
              ),

              /// Countdown Timer on the right
              Row(
                children: [
                  const Icon(Icons.hourglass_bottom_rounded, size: 16, color: Colors.redAccent),
                  const SizedBox(width: 4),
                  Text(
                    _formatDuration(_remaining),
                    style: AppTextStyles.interNormalSm.copyWith(color: Colors.redAccent),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Prize & Entry Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contestInfoTile("🏆 Prize", "₹50,000"),
              _contestInfoTile("💰 Entry", "₹49"),
              _contestInfoTile("👥 Spots Left", "230 / 500"),
            ],
          ),

          const SizedBox(height: 16),

          /// Join Button
          CustomFilledButton(
              title: "Join Now",
              onTap: () {
                context.pushNamed(RouteName.rankDrivers);
              }),
        ],
      ),
    );
  }

  Widget _contestInfoTile(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.interNormalSm.copyWith(color: AppColors.secondary),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.interSemiBoldMd.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }
}
