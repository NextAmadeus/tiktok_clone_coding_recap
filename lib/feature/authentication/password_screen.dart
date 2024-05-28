import 'package:coding_tiktok_recap_20240527/constants/gaps.dart';
import 'package:coding_tiktok_recap_20240527/constants/sizes.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/birthday_screen.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = '';
  bool onTapEyeIconWhat = true;
  bool isPasswordCheckButton = false;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
        isPasswordCheckButton = _password.length >= 8;
      });
    });
  }

  void onTapEyeIcon() {
    setState(() {
      onTapEyeIconWhat = !onTapEyeIconWhat;
    });
  }

  void onSubmit() {
    if (isPasswordOk() == null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const BirthdayScreen()),
      );
    }
  }

  void _passwordClear() {
    _passwordController.clear();
  }

  String? isPasswordOk() {
    if (_password.length >= 8) {
      return null;
    }
    return "This password is not working";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "Password",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v14,
            //input 텍스트 입력란 구현
            TextField(
              obscureText: onTapEyeIconWhat,
              controller: _passwordController,
              autocorrect: false,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //input 아이콘
                    GestureDetector(
                      onTap: _passwordClear,
                      child: const FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey,
                      ),
                    ),
                    Gaps.h10,
                    GestureDetector(
                      onTap: onTapEyeIcon,
                      child: FaIcon(
                        onTapEyeIconWhat
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                hintText: "Make it strong!",
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              onSubmitted: (value) => onSubmit(),
            ),
            Gaps.v20,
            const Text(
              "Your password must have:",
              style: TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v20,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: isPasswordCheckButton ? Colors.green : Colors.grey,
                ),
                Gaps.h5,
                const Text("8 to 20 characters"),
              ],
            ),

            //Next버튼 구현
            Gaps.v20,
            GestureDetector(
              onTap: onSubmit,
              child: NextButton(
                isOk: isPasswordOk() == null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
