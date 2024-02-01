import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class BookTile extends StatelessWidget {
  final String name;
  final String author;
  final String imageUrl;
  final String rating;

  const BookTile({
    Key? key, 
    required this.name,
    required this.author, 
    required this.imageUrl,
    required this.rating,
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
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
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
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icon_star.png',
                      ),
                    ),
                  ),
                ),
                Text(
                  rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
