import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class HistoryTile extends StatelessWidget {
  final String name;
  final String author;
  final String imageUrl;
  final String title;

  const HistoryTile({
    Key? key, 
    required this.name,
    required this.author, 
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    author,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                ],
              ),
            ),
          ],
        ));
  }
}
