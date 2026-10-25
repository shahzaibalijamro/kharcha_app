import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharcha_app/views/layout_screen.dart';
import 'package:kharcha_app/views/login_screen.dart';
import 'package:kharcha_app/views/signup_screen.dart';

import '../constants/app_colors.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void goTologin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LayoutScreen();
        },
      ),
    );
  }

  void goToSignup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LayoutScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(1.0, -1.0),
            child: Image.asset(
              "assets/images/top-right-inner-box.png",
              width: 0.3 * sw,
            ),
          ),
          Align(
            alignment: const Alignment(1.0, -1.0),
            child: Image.asset(
              "assets/images/top-right-outer-box.png",
              width: 0.4 * sw,
            ),
          ),
          Align(
            alignment: const Alignment(-1.0, 0.7),
            child: Image.asset(
              "assets/images/bottom-left-box.png",
              width: 0.3 * sw,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    spacing: sh * 0.025,
                    children: [
                      SizedBox(height: sh * 0.05),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Image.asset(
                          "assets/images/wallet.png",
                          width: sw * 0.07,
                        ),
                      ),
                      Text(
                        "Kharcha",
                        style: GoogleFonts.plusJakartaSans(
                          height: 1,
                          color: AppColors.white,
                          fontSize: 44,
                          fontWeight: const FontWeight(800),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: sw * 0.25),
                        child: Text(
                          "Track every rupee and see where your money goes.",
                          textAlign: TextAlign.center,

                          style: GoogleFonts.plusJakartaSans(
                            height: 1.5,

                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: const FontWeight(500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: InkWell(
                          onTap: goToSignup,
                          hoverColor: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(
                              "Get Started",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.plusJakartaSans(
                                height: 1,
                                color: AppColors.darkNavyText,
                                fontSize: 17,
                                fontWeight: const FontWeight(700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: sh * 0.01),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: InkWell(
                          onTap: goTologin,
                          hoverColor: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            color: Colors.transparent,
                            child: Text(
                              "I already have an account",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.plusJakartaSans(
                                height: 1,
                                color: AppColors.white,
                                fontSize: 15,
                                fontWeight: const FontWeight(700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: sh * 0.03),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryGreen,
    );
  }
}
