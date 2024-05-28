import 'package:coding_tiktok_recap_20240527/constants/gaps.dart';
import 'package:coding_tiktok_recap_20240527/constants/sizes.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/email_screen.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/widgets/next_button.dart';
import 'package:flutter/material.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = '';

  void onTapGoEmailScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const EmailScreen()),
    );
  }

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
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
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v10,
            Text(
              "You can always change this later",
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
            Gaps.v14,
            //input 텍스트 입력란 구현
            TextField(
              onSubmitted: (value) => onTapGoEmailScreen(),
              controller: _usernameController,
              autocorrect: false,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),

            //Next버튼 구현
            Gaps.v20,
            GestureDetector(
              onTap: onTapGoEmailScreen,
              child: NextButton(
                isOk: _username.isNotEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
