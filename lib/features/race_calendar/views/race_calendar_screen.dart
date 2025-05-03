import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onefan_app/common_widgets/app_error_widget.dart';
import 'package:onefan_app/common_widgets/race_card.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/features/race_calendar/controller/race_calendar_controller.dart';
import 'package:onefan_app/features/race_calendar/model/response/race_details_response.dart';

class RaceCalendarScreen extends ConsumerStatefulWidget {
  const RaceCalendarScreen({super.key});

  @override
  ConsumerState<RaceCalendarScreen> createState() => _RaceCalendarScreenState();
}

class _RaceCalendarScreenState extends ConsumerState<RaceCalendarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _filterOptions = ['All', 'Live', 'Upcoming', 'Completed'];
  String _selectedFilter = 'All';
  int _selectedYear = 2025;
  // final List<int> _availableYears = [2023, 2024, 2025];

  // Controller for the search feature
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _filterOptions.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedFilter = _filterOptions[_tabController.index];
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadRaceData();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadRaceData() async {
    await ref.read(raceCalendarControllerProvider.notifier).refresh();
  }

  // Filter races based on selected filter and search query
  List<RaceDetailsResponse> _getFilteredRaces(List<RaceDetailsResponse> raceList) {
    var filteredRaces = raceList;
    // Apply status filter
    if (_selectedFilter != 'All') {
      final status = _selectedFilter.toLowerCase();
      filteredRaces = filteredRaces.where((race) => race.status.toLowerCase() == status).toList();
    }

    // Apply search filter if search is active
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filteredRaces =
          filteredRaces.where((race) => race.raceName.toLowerCase().contains(query) || race.country.toLowerCase().contains(query) || race.circuitName.toLowerCase().contains(query)).toList();
    }

    return filteredRaces;
  }

  // Toggle search mode
  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _searchQuery = '';
      } else {
        // Focus on search field when enabled
        FocusScope.of(context).requestFocus(FocusNode());
      }
    });
  }

  // Change year selection
  void _changeYear(int year) {
    setState(() {
      _selectedYear = year;
      // In a real app, you would load race data for this year
      _loadRaceData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ref.watch(raceCalendarControllerProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (data) {
              final filteredRaces = _getFilteredRaces(data);
              return Column(
                children: [
                  _buildTabBar(),
                  Expanded(
                    child: filteredRaces.isEmpty ? _buildEmptyState() : _buildRaceList(filteredRaces),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => AppErrorWidget(
                errorMessage: "Something went wrong!",
                onRetry: () async {
                  await _loadRaceData();
                }),
          ),
    );
  }

  // Custom AppBar with optional search functionality
  PreferredSizeWidget _buildAppBar() {
    if (_isSearching) {
      return AppBar(
        backgroundColor: AppColors.darkBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: _toggleSearch,
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search races...',
            hintStyle: AppTextStyles.interBoldMd.copyWith(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
      );
    } else {
      return AppBar(
        backgroundColor: AppColors.darkBackground,
        title: Text(
          "$_selectedYear F1 Calendar",
          style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: _toggleSearch,
          ),
          const SizedBox(width: 10),
        ],
      );
    }
  }

  // Year selector at the top
  // Widget _buildYearSelector() {
  //   return Container(
  //     height: 50,
  //     color: AppColors.primary,
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         IconButton(
  //           icon: const Icon(Icons.chevron_left, color: Colors.white),
  //           onPressed: _selectedYear > _availableYears.first ? () => _changeYear(_selectedYear - 1) : null,
  //           color: _selectedYear > _availableYears.first ? Colors.white : Colors.white.withOpacity(0.3),
  //         ),
  //         Expanded(
  //           child: SingleChildScrollView(
  //             scrollDirection: Axis.horizontal,
  //             child: Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: _availableYears.map((year) => _buildYearButton(year)).toList(),
  //             ),
  //           ),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.chevron_right, color: Colors.white),
  //           onPressed: _selectedYear < _availableYears.last ? () => _changeYear(_selectedYear + 1) : null,
  //           color: _selectedYear < _availableYears.last ? Colors.white : Colors.white.withOpacity(0.3),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Individual year button
  Widget _buildYearButton(int year) {
    final isSelected = year == _selectedYear;

    return GestureDetector(
      onTap: () => _changeYear(year),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          year.toString(),
          style: AppTextStyles.rajdhaniBoldMd.copyWith(
            color: isSelected ? AppColors.primary : Colors.white,
          ),
        ),
      ),
    );
  }

  // Tab bar for race filters
  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelStyle: AppTextStyles.interBoldMd,
      labelColor: AppColors.primary,
      unselectedLabelColor: Colors.grey,
      indicatorColor: AppColors.primary,
      indicatorWeight: 3,
      tabs: _filterOptions.map((filter) => Tab(text: filter)).toList(),
      labelPadding: EdgeInsets.zero,
      tabAlignment: TabAlignment.fill,
    );
  }

  // Race list with filtered races
  Widget _buildRaceList(List<RaceDetailsResponse> races) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: races.length,
      itemBuilder: (context, index) {
        // Group races by month
        final showMonthHeader = index == 0 || races[index].raceStartTime!.month != races[index - 1].raceStartTime!.month;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showMonthHeader) _buildMonthHeader(races[index].raceStartTime ?? DateTime.now()),
            RaceCard(race: races[index]),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  // Month header for grouping races
  Widget _buildMonthHeader(DateTime date) {
    final monthNames = ['', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 12, top: 8),
      child: Text(
        monthNames[date.month],
        style: AppTextStyles.interSemiBoldLg.copyWith(
          color: AppColors.background,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Empty state when no races match filters
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sports_score_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            "No races found",
            style: AppTextStyles.interSemiBoldLg.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isNotEmpty ? "Try a different search term" : "No races match the selected filter",
            style: AppTextStyles.interNormalMd.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
