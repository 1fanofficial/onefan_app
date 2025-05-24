import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/features/race_calendar/model/response/race_details_response.dart';

class RaceCard extends StatelessWidget {
  final RaceDetailsResponse race;

  const RaceCard({super.key, required this.race});

  String _formatDate() {
    final raceDate = DateFormat('dd').format(race.raceStartTime ?? DateTime.now());
    final month = DateFormat('MMM').format(race.raceStartTime ?? DateTime.now()).toUpperCase();

    return "$raceDate $month";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background patterns
            const Positioned(
              right: -20,
              bottom: -20,
              child: Opacity(
                opacity: 0.05,
                child: Icon(
                  Icons.sports_motorsports,
                  size: 115,
                  color: Colors.white,
                ),
              ),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Round ${race.round}",
                        style: AppTextStyles.interSemiBoldMd.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        race.raceName,
                        style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${race.circuitName} • ${race.country}",
                        style: AppTextStyles.interNormalSm.copyWith(
                          color: Colors.white70,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      // Race details footer
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDetailItem(
                              Icons.speed_rounded,
                              "${race.laps} laps",
                            ),
                            const SizedBox(width: 20),
                            _buildDetailItem(
                              Icons.straighten_rounded,
                              "${(race.laps * race.trackLength).toStringAsFixed(1)} km",
                            ),
                          ],
                        ),
                      ),
                      _buildWinnerSection(context),
                    ],
                  ),

                  const Spacer(),
                  // Right Date
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _formatDate(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.rajdhaniBoldLg.copyWith(
                        color: Colors.white,
                        height: 0.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWinnerSection(BuildContext context) {
    if (race.status.toLowerCase() != 'completed') {
      return const SizedBox.shrink();
    }

    Color teamColor = race.raceWinner != null ? Color(int.parse(race.raceWinner!.team.teamColor)) : AppColors.background;

    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.85),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border(
            left: BorderSide(color: teamColor, width: 3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Position indicator (P1)

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFE10600), // F1 red
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "P1",
                style: AppTextStyles.rajdhaniBoldSm.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 8),

            // Winner details
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      "${race.raceWinner?.firstName ?? "-"} ${race.raceWinner?.lastName ?? "-"}",
                      style: AppTextStyles.rajdhaniBoldMd.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    race.raceWinner?.team.name ?? "-",
                    style: AppTextStyles.interNormalXs.copyWith(
                      color: teamColor,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Driver number badge
            Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: teamColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "#${race.raceWinner?.carNumber ?? "-"}",
                style: AppTextStyles.rajdhaniBoldSm.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white70,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.interNormalSm.copyWith(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
