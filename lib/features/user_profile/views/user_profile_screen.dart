import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:onefan_app/common_widgets/app_error_widget.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/user_profile/controller/user_profile_controller.dart';
import 'package:onefan_app/features/user_profile/model/response/user_profile_response.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  Future<void> onLogOut() async {
    await AppPreferences().clearAuthData();
    ref.read(userProfileControllerProvider.notifier).clearCache();
    ref.invalidate(userProfileControllerProvider);
    context.goNamed(RouteName.signin);
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(userProfileControllerProvider).when(
          data: (data) => _buildBody(data),
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          ),
          error: (error, stackTrace) => Scaffold(
            body: AppErrorWidget(
                errorMessage: "Something went wrong!",
                onRetry: () async {
                  await ref.read(userProfileControllerProvider.notifier).refresh();
                }),
          ),
        );
  }

  Widget _buildBody(UserProfileResponse? data) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(data),
              _buildStatsSection(data),
              const SizedBox(height: 10),
              _buildWalletSection(data),
              const SizedBox(height: 10),
              _buildPersonalInfoSection(data),
              const SizedBox(height: 10),
              _buildSettingsSection(data),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserProfileResponse? data) {
    final String fullName = "${data?.firstName.trim() ?? ""} ${data?.lastName.trim() ?? ""}";

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary.withOpacity(0.1), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          children: [
            const CircleAvatar(
              radius: 44,
              backgroundColor: AppColors.background,
              child: Icon(Icons.person, size: 60),
            ),
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName.isEmpty ? "Player" : fullName,
                  style: AppTextStyles.rajdhaniBoldXxl,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppColors.background,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Rookie',
                        style: AppTextStyles.interBoldMd.copyWith(
                          color: AppColors.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(UserProfileResponse? data) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('Points', '3500', Icons.star_border_purple500),
            _verticalDivider(),
            _buildStatItem('Rank', '#25', Icons.leaderboard_rounded),
            _verticalDivider(),
            _buildStatItem('Contests', '42', Icons.emoji_events),
            _verticalDivider(),
            _buildStatItem('Race', '28', Icons.sports_score_outlined),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 60,
      width: 1,
      color: Colors.grey.withOpacity(0.3),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 22, color: AppColors.background),
        ),
        // Icon(icon, color: AppColors.primary, size: 22),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.interBoldXl.copyWith(
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.rajdhaniMediumMd.copyWith(
            color: AppColors.background,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoSection(UserProfileResponse? data) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person_outline, color: AppColors.primary),
                const SizedBox(width: 10),
                Text('Personal Information', style: AppTextStyles.rajdhaniBoldXl),
              ],
            ),
            const Divider(height: 24, thickness: 0.5),
            _buildInfoRow(Icons.phone, 'Mobile', data?.phone ?? "-"),
            _buildInfoRow(Icons.email, 'Email', data?.emailId ?? "-"),
            _buildInfoRow(
              Icons.cake,
              'Date of Birth',
              data?.dob != null ? DateFormat('MMM d, yyyy').format(data!.dob) : "-",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.rajdhaniMediumSm.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.interMediumMd.copyWith(
                  color: AppColors.background,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletSection(UserProfileResponse? data) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_balance_wallet, color: AppColors.success),
                const SizedBox(width: 10),
                Text('Wallet', style: AppTextStyles.rajdhaniBoldXl),
              ],
            ),
            const Divider(height: 24, thickness: 0.5),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary.withOpacity(0.8), AppColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Balance',
                        style: AppTextStyles.rajdhaniMediumMd.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '₹500',
                        style: AppTextStyles.interBoldXl.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("ADD CASH", style: AppTextStyles.rajdhaniBoldMd),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.info,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("WITHDRAW", style: AppTextStyles.rajdhaniBoldMd),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.info.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.history, size: 16, color: AppColors.info),
              ),
              title: Text(
                "Transaction History",
                style: AppTextStyles.rajdhaniBoldLg.copyWith(
                  color: AppColors.background,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(UserProfileResponse? data) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          _buildSettingTile(
            Icons.edit,
            'Update Profile',
            AppColors.info,
            () {
              // Navigate to Update Profile
            },
          ),
          const Divider(height: 1, thickness: 0.5),
          _buildSettingTile(
            Icons.lock,
            'Change Password',
            AppColors.info,
            () {
              // Change password flow
            },
          ),
          const Divider(height: 1, thickness: 0.5),
          _buildSettingTile(
            Icons.help_outline,
            'Help & Support',
            AppColors.info,
            () {
              // Help and support
            },
          ),
          const Divider(height: 1, thickness: 0.5),
          _buildSettingTile(
            Icons.logout,
            'Logout',
            AppColors.primary,
            onLogOut,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(
    IconData icon,
    String title,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 22, color: iconColor),
      ),
      title: Text(
        title,
        style: AppTextStyles.rajdhaniBoldLg.copyWith(
          color: title == 'Logout' ? AppColors.primary : AppColors.background,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
