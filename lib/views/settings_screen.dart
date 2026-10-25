import 'package:flutter/material.dart';
import 'package:kharcha_app/constants/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "October Spending",
                style: TextStyle(
                  fontWeight: FontWeight(600),
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Rs 40,000",
                style: TextStyle(
                  fontWeight: FontWeight(800),
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              ClipRRect(
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(12),
                  value: 0.67,
                  minHeight: 14,
                  color: AppColors.white,
                  backgroundColor: AppColors.white.withValues(alpha: .1),
                ),
              ),
              const SizedBox(height: 10),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "October Spending",
                    style: TextStyle(
                      fontWeight: FontWeight(600),
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "October Spending",
                    style: TextStyle(
                      fontWeight: FontWeight(600),
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
