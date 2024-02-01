import 'package:libraryucic/shared/theme.dart';
import 'package:flutter/material.dart';

class InformationItem extends StatelessWidget {
  final String text;

  const InformationItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/icon_check.png',
                ),
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
