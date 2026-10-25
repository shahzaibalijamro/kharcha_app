import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharcha_app/constants/app_colors.dart';
import 'package:kharcha_app/widgets/text_field.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: "shahzaib@gmail.com");
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController(text: "12345");
  final passwordFocusNode = FocusNode();
  bool obscurePassword = true;
  String? loginError;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignUpScreen();
        },
      ),
    );
  }

  // void rememberUser(User user) async {
  //   final userInString = user.toJSON();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('user', userInString);
  // }

  void login() async {
    // final email = emailController.text.trim().toLowerCase();
    // final password = passwordController.text;
    // User? user;
    // final users = await getSavedUsersInMemory();
    // if (!mounted) return;
    // for (final candidate in users) {
    //   if (candidate.email.toLowerCase() == email &&
    //       candidate.password == password) {
    //     user = candidate;
    //     break;
    //   }
    // }

    // if (user == null) {
    //   setState(() => loginError = 'Email or password is incorrect');
    //   return;
    // }

    // if (rememberMe) {
    //   rememberUser(user);
    // }

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => LayoutPageScreen(userEmail: user!.email),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // SizedBox(height: sh * 0.1),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Image.asset(
              "assets/images/wallet.png",
              color: AppColors.white,
              // width: sw * 0.01,
              // height: sh * 0.03,
            ),
          ),
          CircleAvatar(
            radius: sw * 0.1,
            backgroundImage: const AssetImage("assets/images/wallet.png"),
            foregroundColor: AppColors.primaryGreen,
          ),
          const SizedBox(height: 30),
          Column(
            spacing: 1,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Welcome back",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.darkNavyText,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  height: 1.0,
                ),
              ),
              Text(
                "Log in to sync your tasks across all your devices.",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.mutedText,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email address",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.darkNavyText,
                  fontWeight: const FontWeight(700),
                  fontSize: 14,
                ),
              ),
              CustomTextField(
                focusNode: emailFocusNode,
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                hint: "Enter your email",
                autoFocused: true,
                minLines: 1,
                maxLines: 1,
              ),
              const SizedBox(height: 5),
              Text(
                "Password",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.darkNavyText,
                  fontWeight: const FontWeight(700),
                  fontSize: 14,
                ),
              ),
              CustomTextField(
                focusNode: passwordFocusNode,
                prefixIcon: Icons.lock_outline_rounded,
                controller: passwordController,
                hint: "Enter your password",
                autoFocused: false,
                minLines: 1,
                isPassword: true,
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(height: 7),
          if (loginError != null) ...[
            Text(loginError!, style: const TextStyle(color: Colors.red)),
          ],
          Row(
            children: [
              Checkbox(
                activeColor: AppColors.primaryPurple,
                side: const BorderSide(color: AppColors.mutedText),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                },
              ),
              Text(
                "Remember me",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.mutedText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: login,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryPurple,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Log in',
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: AppColors.mutedText.withValues(alpha: 0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "or",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.mutedText,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: AppColors.mutedText.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  const Icon(Icons.person_outline, color: AppColors.mutedText),
                  Text(
                    'Continue as guest',
                    style: GoogleFonts.googleSansFlex(
                      color: AppColors.darkNavyText,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New here?",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.mutedText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(),
                onPressed: goToSignUp,
                child: Text(
                  "Create an account",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: sh * 0.1),
        ],
      ),
    );
  }
}
