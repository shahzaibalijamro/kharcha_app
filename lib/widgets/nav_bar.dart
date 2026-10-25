import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharcha_app/constants/app_colors.dart';
import 'package:kharcha_app/constants/icons.dart';

class NavItemBottom extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int index) onPressed;
  final String text;
  final String image;
  const new({
    super.key,
    required this.index,
    required this.onPressed,
    required this.text,
    required this.image,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;
    return IconButton(
      onPressed: () => onPressed(index),
      icon: Column(
        children: [
          Image.asset(
            image,
            width: 22,
            height: 30,
            color: isSelected ? AppColors.primaryGreen : AppColors.mutedText,
          ),
          Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight(isSelected ? 700 : 600),
              fontSize: 14,
              color: isSelected ? AppColors.primaryGreen : AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int index) onPressed;

  const new({super.key, required this.currentIndex, required this.onPressed});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomAppBar(
        color: Colors.white,
        // height: 64,
        padding: EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItemBottom(
              image: AppIcons.homeIcon,
              index: 0,
              text: "Home",
              onPressed: widget.onPressed,
              currentIndex: widget.currentIndex,
            ),
            NavItemBottom(
              image: AppIcons.expensesIcon,
              index: 1,
              text: "Expenses",
              onPressed: widget.onPressed,
              currentIndex: widget.currentIndex,
            ),
            IconButton(
              iconSize: 27,
              onPressed: () {
                // Open your Add Expense bottom sheet
              },
              icon: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            NavItemBottom(
              image: AppIcons.summaryIcon,

              index: 2,
              text: "Summary",
              onPressed: widget.onPressed,
              currentIndex: widget.currentIndex,
            ),
            NavItemBottom(
              image: AppIcons.settingsIcon,

              index: 3,
              text: "Settings",
              onPressed: widget.onPressed,
              currentIndex: widget.currentIndex,
            ),
          ],
        ),
      ),
    );
  }
}
