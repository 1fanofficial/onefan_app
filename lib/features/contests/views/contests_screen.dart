import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onefan_app/common_widgets/app_error_widget.dart';
import 'package:onefan_app/common_widgets/contest_card.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/features/contests/controller/contest_controller.dart';
import 'package:onefan_app/features/contests/model/response/contest_response.dart';

class ContestsScreen extends ConsumerStatefulWidget {
  const ContestsScreen({super.key});

  @override
  ConsumerState<ContestsScreen> createState() => _ContestsScreenState();
}

class _ContestsScreenState extends ConsumerState<ContestsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  List<ContestRespone> _allContests = [];
  final ValueNotifier<List<ContestRespone>> _filteredContests = ValueNotifier<List<ContestRespone>>([]);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getLiveContests();
    });
  }

  Future<void> getLiveContests() async {
    _allContests = await ref.read(contestControllerProvider.notifier).getContestsByStatus(status: ContestStatus.open.value);
    _handleTabChange();
    setState(() {});
  }

  void _handleTabChange() {
    if (!mounted) return;

    if (_tabController.index == 0) {
      _filteredContests.value = List.from(_allContests);
    } else {
      _filteredContests.value = _allContests.where((contest) => contest.hasJoined).toList();
    }

    // Sort by deadline (soonest first)
    _filteredContests.value.sort((a, b) => a.deadline.compareTo(b.deadline));
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildEmptyState(String message, String submessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sports_motorsports, size: 64, color: Colors.grey.shade700),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppTextStyles.interSemiBoldLg.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            submessage,
            style: AppTextStyles.interNormalMd.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Contests", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              // Navigate to contest history screen
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab bar
          Container(
            // margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelStyle: AppTextStyles.interSemiBoldMd,
              unselectedLabelStyle: AppTextStyles.interNormalMd,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primary,
              tabs: const [
                Tab(text: "All Contests"),
                Tab(text: "My Contests"),
              ],
            ),
          ),

          ref.watch(contestControllerProvider).when(
                loading: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                error: (e, st) => AppErrorWidget(
                  errorMessage: "Something went wrong!",
                  onRetry: () {
                    getLiveContests();
                  },
                ),
                data: (contests) {
                  _allContests = contests;
                  return Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // All Contests Tab
                        _buildContestsList("No contests available", "Check back later"),

                        // My Contests Tab
                        _buildContestsList("You haven't joined any contests yet", "Join a contest to see it here"),
                      ],
                    ),
                  );
                },
              ),
        ],
      ),
    );
  }

  Widget _buildContestsList(String emptyMessage, String emptySubmessage) {
    return ValueListenableBuilder(
      valueListenable: _isLoading,
      builder: (context, isLoading, child) => isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : RefreshIndicator(
              onRefresh: () async {
                _isLoading.value = true;
                await getLiveContests();
                _isLoading.value = false;
              },
              child: ValueListenableBuilder(
                valueListenable: _filteredContests,
                builder: (context, contests, child) => contests.isEmpty
                    ? _buildEmptyState(emptyMessage, emptySubmessage)
                    : ListView.separated(
                        padding: const EdgeInsets.all(15),
                        itemCount: contests.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemBuilder: (context, index) => ContestCard(
                          contestDetails: contests[index],
                        ),
                      ),
              ),
            ),
    );
  }
}
