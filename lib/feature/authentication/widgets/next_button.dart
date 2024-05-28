import 'package:coding_tiktok_recap_20240527/constants/sizes.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.isOk});

  final bool isOk;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      //버튼 스타일
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.size5),
          ),
          color: isOk ? Theme.of(context).primaryColor : Colors.grey,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),

          //버튼 안의 텍스트
          child: Text(
            "Next",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
