import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onefan_app/common_widgets/driver_card.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/features/auth/views/widgets/custom_filled_button.dart';

class Driver {
  final String id;
  final String name;
  final String team;
  final Color teamColor;
  final Gradient teamGradient;

  Driver({
    required this.id,
    required this.name,
    required this.team,
    required this.teamColor,
    required this.teamGradient,
  });
}

final List<Driver> drivers2025 = [
  // Red Bull Racing
  Driver(
    id: 'verstappen',
    name: 'Max Verstappen',
    team: 'Red Bull Racing',
    teamColor: AppColors.redBull,
    teamGradient: AppColors.redBullGradient,
  ),
  Driver(
    id: 'tsunoda',
    name: 'Yuki Tsunoda',
    team: 'Racing Bulls',
    teamColor: AppColors.redBull,
    teamGradient: AppColors.redBullGradient,
  ),

  // Mercedes
  Driver(
    id: 'russell',
    name: 'George Russell',
    team: 'Mercedes',
    teamColor: AppColors.mercedes,
    teamGradient: AppColors.mercedesGradient,
  ),
  Driver(
    id: 'antonelli',
    name: 'Andrea Kimi Antonelli',
    team: 'Mercedes',
    teamColor: AppColors.mercedes,
    teamGradient: AppColors.mercedesGradient,
  ),

  // Ferrari
  Driver(
    id: 'leclerc',
    name: 'Charles Leclerc',
    team: 'Ferrari',
    teamColor: AppColors.ferrari,
    teamGradient: AppColors.ferrariGradient,
  ),
  Driver(
    id: 'hamilton',
    name: 'Lewis Hamilton',
    team: 'Ferrari',
    teamColor: AppColors.ferrari,
    teamGradient: AppColors.ferrariGradient,
  ),

  // McLaren
  Driver(
    id: 'norris',
    name: 'Lando Norris',
    team: 'McLaren',
    teamColor: AppColors.mclaren,
    teamGradient: AppColors.mclarenGradient,
  ),
  Driver(
    id: 'piastri',
    name: 'Oscar Piastri',
    team: 'McLaren',
    teamColor: AppColors.mclaren,
    teamGradient: AppColors.mclarenGradient,
  ),

  // Aston Martin
  Driver(
    id: 'alonso',
    name: 'Fernando Alonso',
    team: 'Aston Martin',
    teamColor: AppColors.astonMartin,
    teamGradient: AppColors.astonMartinGradient,
  ),
  Driver(
    id: 'stroll',
    name: 'Lance Stroll',
    team: 'Aston Martin',
    teamColor: AppColors.astonMartin,
    teamGradient: AppColors.astonMartinGradient,
  ),

  // Alpine
  Driver(
    id: 'gasly',
    name: 'Pierre Gasly',
    team: 'Alpine',
    teamColor: AppColors.alpine,
    teamGradient: AppColors.alpineGradient,
  ),
  Driver(
    id: 'doohan',
    name: 'Jack Doohan',
    team: 'Alpine',
    teamColor: AppColors.alpine,
    teamGradient: AppColors.alpineGradient,
  ),

  // Haas
  Driver(
    id: 'ocon',
    name: 'Esteban Ocon',
    team: 'Haas',
    teamColor: AppColors.haas,
    teamGradient: AppColors.haasGradient,
  ),
  Driver(
    id: 'bearman',
    name: 'Oliver Bearman',
    team: 'Haas',
    teamColor: AppColors.haas,
    teamGradient: AppColors.haasGradient,
  ),

  // Williams
  Driver(
    id: 'albon',
    name: 'Alexander Albon',
    team: 'Williams',
    teamColor: AppColors.williams,
    teamGradient: AppColors.williamsGradient,
  ),
  Driver(
    id: 'sainz',
    name: 'Carlos Sainz',
    team: 'Williams',
    teamColor: AppColors.williams,
    teamGradient: AppColors.williamsGradient,
  ),

  // Racing Bulls
  Driver(
    id: 'lawson',
    name: 'Liam Lawson',
    team: 'Red Bull Racing',
    teamColor: AppColors.racingBulls,
    teamGradient: AppColors.racingBullsGradient,
  ),
  Driver(
    id: 'hadjar',
    name: 'Isack hadjar',
    team: 'Racing Bulls',
    teamColor: AppColors.racingBulls,
    teamGradient: AppColors.racingBullsGradient,
  ),

  // Sauber
  Driver(
    id: 'hulkenberg',
    name: 'Nico Hülkenberg',
    team: 'Sauber',
    teamColor: AppColors.sauber,
    teamGradient: AppColors.sauberGradient,
  ),
  Driver(
    id: 'bortoleto',
    name: 'Gabriel Bortoleto',
    team: 'Sauber',
    teamColor: AppColors.sauber,
    teamGradient: AppColors.sauberGradient,
  ),
];

class RankDriversScreen extends StatefulWidget {
  const RankDriversScreen({super.key});

  @override
  State<RankDriversScreen> createState() => _RankDriversScreenState();
}

class _RankDriversScreenState extends State<RankDriversScreen> {
  late List<Driver> _rankedDrivers;
  final ValueNotifier<String?> _fastestLapDriverId = ValueNotifier<String?>(null);
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _rankedDrivers = List.from(drivers2025);
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
            ValueListenableBuilder(
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
                      final driver = _rankedDrivers[index];
                      return GestureDetector(
                        key: ValueKey(driver.id),
                        onTap: () {
                          _fastestLapDriverId.value = fastestLapDriverId == driver.id ? null : driver.id;
                        },
                        child: DriverCard(
                          driver: driver,
                          selectedDriverId: fastestLapDriverId,
                          finishPosition: index + 1,
                        ),
                      );
                    },
                  ),
                );
              },
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
                    child: CustomFilledButton(
                      title: "Next",
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => preview(),
                        );
                      },
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
              final driver = _rankedDrivers[index];
              return DriverCard(
                driver: driver,
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
