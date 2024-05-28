import 'package:coding_tiktok_recap_20240527/constants/gaps.dart';
import 'package:coding_tiktok_recap_20240527/constants/sizes.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/login_screen.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/username_screen.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onTapLogInButoon(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LogInScreen()));
  }

  void onTapGoToUsernameScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UsernameScreen()));
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
              "Sign up for TikTok",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v24,
            Text(
              "Create a profile, follow other accounts, make your own videos, and more.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey.shade500,
              ),
            ),
            Gaps.v32,
            //버튼
            GestureDetector(
              onTap: () => onTapGoToUsernameScreen(context),
              child: const SignUpButton(
                icon: FaIcon(FontAwesomeIcons.user),
                text: "Use email & password",
              ),
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
              onTap: () => onTapLogInButoon(context),
              child: Text(
                "Log in",
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
