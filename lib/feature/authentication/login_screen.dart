import 'package:coding_tiktok_recap_20240527/constants/gaps.dart';
import 'package:coding_tiktok_recap_20240527/constants/sizes.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/signup_screen.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  void onTapSignUpButton(BuildContext context) {
    Navigator.of(context).pop(
      const SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          children: [
            Gaps.v80,
            const Text(
              "Log in for TikTok",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v24,
            Text(
              "Manage your account, check notifications, comment on videos, and more.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey.shade500,
              ),
            ),
            Gaps.v32,
            //버튼
            const SignUpButton(
              icon: FaIcon(FontAwesomeIcons.user),
              text: "Use email & password",
            ),
            Gaps.v20,
            const SignUpButton(
              icon: FaIcon(FontAwesomeIcons.apple),
              text: "Continue with Apple",
            ),
          ],
        ),
      ),
      //바텀바 구현
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            Gaps.h10,
            GestureDetector(
              onTap: () => onTapSignUpButton(context),
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
