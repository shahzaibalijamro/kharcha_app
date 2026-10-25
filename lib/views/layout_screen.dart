import 'package:flutter/material.dart';
import 'package:kharcha_app/constants/app_colors.dart';
import 'package:kharcha_app/views/expenses_screen.dart';
import 'package:kharcha_app/views/home_screen.dart';
import 'package:kharcha_app/views/settings_screen.dart';
import 'package:kharcha_app/views/summary_screen.dart';
import 'package:kharcha_app/widgets/nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const ExpensesScreen(),
    const SummaryScreen(),
    const SettingsScreen(),
  ];
  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onPressed: updateCurrentIndex,
      ),
    );
  }
}
