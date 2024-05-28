import 'package:coding_tiktok_recap_20240527/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.text, required this.icon});
  final String text;
  final FaIcon icon;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
            width: Sizes.size2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.size20,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: icon,
                ),
              ),
              Align(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
