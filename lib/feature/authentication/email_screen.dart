import 'package:coding_tiktok_recap_20240527/constants/gaps.dart';
import 'package:coding_tiktok_recap_20240527/constants/sizes.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/password_screen.dart';
import 'package:coding_tiktok_recap_20240527/feature/authentication/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = '';

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  String? validEmail() {
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (regExp.hasMatch(_email) && _email.isEmpty == false) {
      return null;
    } else {
      return "Eamil is not valid";
    }
  }

  void onSubmit() {
    if (validEmail() == null) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PasswordScreen()));
    }
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
              "What is your email?",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v14,
            //input 텍스트 입력란 구현
            TextField(
              controller: _emailController,
              autocorrect: false,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: "Email",
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

            //Next버튼 구현
            Gaps.v20,
            GestureDetector(
              onTap: onSubmit,
              child: NextButton(
                isOk: validEmail() == null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
