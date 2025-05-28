import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/common_widgets/app_error_widget.dart';
import 'package:onefan_app/common_widgets/driver_card.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/core/utils/common_functions.dart';
import 'package:onefan_app/features/auth/views/widgets/custom_filled_button.dart';
import 'package:onefan_app/features/contests/controller/add_contest_entry_controller.dart';
import 'package:onefan_app/features/contests/controller/drivers_controller.dart';
import 'package:onefan_app/features/contests/model/request/contest_entry_request.dart';
import 'package:onefan_app/features/contests/model/request/driver_ranking_request.dart';
import 'package:onefan_app/features/contests/model/response/contest_response.dart';
import 'package:onefan_app/features/contests/model/response/race_driver_response.dart';

class RankDriversScreen extends ConsumerStatefulWidget {
  const RankDriversScreen({
    super.key,
    required this.contestDetails,
  });

  final ContestRespone contestDetails;

  @override
  ConsumerState<RankDriversScreen> createState() => _RankDriversScreenState();
}

class _RankDriversScreenState extends ConsumerState<RankDriversScreen> {
  List<RaceDriverResponse> _rankedDrivers = [];
  final ValueNotifier<String?> _fastestLapDriverId = ValueNotifier<String?>(null);
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getDriversForRace();
    });
  }

  Future<void> getDriversForRace() async {
    _rankedDrivers = await ref.read(driversControllerProvider.notifier).getDriversForRace(raceId: widget.contestDetails.raceDetails.id);
    setState(() {});
  }

  void addContestEntry() async {
    if (_fastestLapDriverId.value == null) {
      CommonFunctions.showToastMessage(context: context, message: "Please select fastest lap driver", messageType: MessageType.error);
      return;
    }

    try {
      List<DriverRankingRequest> driverRankings = [];
      for (int i = 0; i < _rankedDrivers.length; i++) {
        DriverRankingRequest driverRankingRequest = DriverRankingRequest(
          driverId: _rankedDrivers[i].driver.id,
          predictedPosition: i + 1,
        );
        driverRankings.add(driverRankingRequest);
      }

      ContestEntryRequest contestEntryRequest = ContestEntryRequest(
        contestId: widget.contestDetails.id,
        driverRankings: driverRankings,
        fastestLapDriverId: _fastestLapDriverId.value!,
      );

      await ref.read(addContestEntryControllerProvider.notifier).addContestEntry(
            payload: contestEntryRequest.toJson(),
          );

      if (!mounted) return;

      CommonFunctions.showToastMessage(
        context: context,
        message: "Contest Joined",
        messageType: MessageType.success,
      );

      context.goNamed(RouteName.contests);
    } catch (e) {
      if (!mounted) return;

      CommonFunctions.showToastMessage(
        context: context,
        message: "Failed to join contest",
        messageType: MessageType.error,
      );
    }
  }

  @override
  void dispose() {
    _fastestLapDriverId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Positon Your Grid', style: AppTextStyles.rajdhaniBoldXl),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How to play?',
                          style: AppTextStyles.interBoldLg,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '1. Drag and drop drivers to rank them in your predicted finishing order.',
                          style: AppTextStyles.interNormalMd,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '2. Tap on a driver to select them for the fastest lap.',
                          style: AppTextStyles.interNormalMd,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ref.watch(driversControllerProvider).when(
                  loading: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                  error: (e, st) => AppErrorWidget(
                      errorMessage: "",
                      onRetry: () {
                        getDriversForRace();
                      }),
                  data: (_) => ValueListenableBuilder(
                    key: _listKey,
                    valueListenable: _fastestLapDriverId,
                    builder: (context, fastestLapDriverId, _) {
                      return Expanded(
                        child: ReorderableListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: _rankedDrivers.length,
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              if (newIndex > oldIndex) newIndex -= 1;
                              final item = _rankedDrivers.removeAt(oldIndex);
                              _rankedDrivers.insert(newIndex, item);
                            });
                          },
                          itemBuilder: (context, index) {
                            final raceDriver = _rankedDrivers[index];
                            return GestureDetector(
                              key: ValueKey(raceDriver.driver.id),
                              onTap: () {
                                _fastestLapDriverId.value = fastestLapDriverId == raceDriver.driver.id ? null : raceDriver.driver.id;
                              },
                              child: DriverCard(
                                driver: raceDriver.driver,
                                selectedDriverId: fastestLapDriverId,
                                finishPosition: index + 1,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomFilledButton(
                      title: "Preview",
                      buttonColor: AppColors.background,
                      textColor: AppColors.secondary,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => preview(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ref.watch(addContestEntryControllerProvider).when(
                          data: (data) => CustomFilledButton(
                            title: "Next",
                            onTap: addContestEntry,
                          ),
                          error: (error, stackTrace) => CustomFilledButton(
                            title: "Next",
                            onTap: addContestEntry,
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget preview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 20),
            const Visibility(visible: false, maintainState: true, maintainAnimation: true, child: Icon(Icons.close_sharp)),
            const Spacer(),
            Text(
              "THE FINISHING GRID",
              style: AppTextStyles.rajdhaniBoldXxl.copyWith(letterSpacing: 1, decoration: TextDecoration.underline),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close_sharp)),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: _rankedDrivers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 3, // Adjust as needed
            ),
            itemBuilder: (context, index) {
              final raceDriver = _rankedDrivers[index];
              return DriverCard(
                driver: raceDriver.driver,
                selectedDriverId: _fastestLapDriverId.value,
                finishPosition: index + 1,
                isPreview: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
