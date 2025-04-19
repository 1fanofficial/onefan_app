import 'package:flutter/material.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/features/contests/views/rank_drivers_screen.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    super.key,
    required this.driver,
    required this.selectedDriverId,
    required this.finishPosition,
    this.isPreview = false,
  });

  final Driver driver;
  final int finishPosition;
  final String? selectedDriverId;
  final bool isPreview;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntrinsicHeight(
          child: Container(
            key: ValueKey(driver.id),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(gradient: driver.teamGradient),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 25,
                  color: AppColors.background,
                  child: Text(
                    "$finishPosition",
                    style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: AppColors.primary),
                  ),
                ),
                if (!isPreview)
                  ColoredBox(
                    color: driver.teamColor,
                    child: const SizedBox(
                      height: 60,
                      width: 50,
                      child: Icon(
                        Icons.person_2_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(driver.name, style: AppTextStyles.rajdhaniBoldLg),
                    Text(driver.team, style: AppTextStyles.interSemiBoldSm),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (driver.id == selectedDriverId)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              color: const Color(0xFF9B30FF),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.timer_outlined, size: 16),
                  if (!isPreview) ...[
                    const SizedBox(width: 5),
                    Text(
                      "fastet lap",
                      style: AppTextStyles.interBoldSm.copyWith(color: Colors.white),
                    )
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}
