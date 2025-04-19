import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';

class RootScreen extends StatefulWidget {
  final Widget child;

  const RootScreen({super.key, required this.child});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  static const tabs = [RouteName.home, RouteName.contests, RouteName.raceCalendar, RouteName.profile];

  void _onItemTapped(int index) {
    context.goNamed(tabs[index]);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.rajdhaniBoldLg,
        unselectedLabelStyle: AppTextStyles.rajdhaniSemiBoldLg,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events_rounded), label: 'Contests'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'Race'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
