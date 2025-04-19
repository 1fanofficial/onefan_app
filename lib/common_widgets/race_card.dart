import 'package:flutter/material.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';

class RaceCard extends StatelessWidget {
  const RaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Round 5",
                  style: AppTextStyles.interSemiBoldMd.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Saudi Arabian Grand Prix",
                  style: AppTextStyles.rajdhaniBoldXxl.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Jeddah Corniche Circuit • Saudi Arabia",
                  style: AppTextStyles.interNormalSm.copyWith(
                    color: Colors.white70,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),

          // Right Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "18–20",
                style: AppTextStyles.rajdhaniBoldXl.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "APR",
                style: AppTextStyles.rajdhaniBoldMd.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
