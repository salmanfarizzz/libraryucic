import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class ButtonHistory extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const ButtonHistory({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 28,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(historyRadius),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
