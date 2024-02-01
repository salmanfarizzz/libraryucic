import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:libraryucic/ui/widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/img_background.png',
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Unlock Knowledge, Anytime, Anywhere',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your personalized reading journey\nstarts here',
                  style: whiteTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  title: 'Get Started',
                  width: 220,
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 80,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
