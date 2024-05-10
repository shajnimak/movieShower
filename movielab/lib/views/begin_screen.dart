// lib/views/main_screen.dart
import 'package:flutter/material.dart';
import '../tools/border.dart';
import '../tools/colors.dart';
import '../tools/styles.dart';
import '../views/auth_screens/auth_begin_screen.dart';

class BeginScreen extends StatelessWidget {
  const BeginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        color: redColor1,
        child: SafeArea(
            child: Scaffold(
                body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/img/main_poster.png', width: width),
            const Text(
              'Welcome to',
              style: textStyle1,
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/img/logo.png', width: width),
            const Text(
              'official page',
              style: textStyle1,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.007,
                    ),
                    margin: EdgeInsets.all(width * 0.01),
                    decoration: BoxDecoration(
                      color: redColor1,
                      borderRadius: getBorderRadiusWidget(context, 1),
                    )),
                Container(
                    padding: EdgeInsets.all(width * 0.015),
                    margin: EdgeInsets.all(width * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: getBorderRadiusWidget(context, 1),
                    )),
                Container(
                    padding: EdgeInsets.all(width * 0.015),
                    margin: EdgeInsets.all(width * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: getBorderRadiusWidget(context, 1),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06, vertical: height * 0.085),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: getShapeWidget(context, 1),
                    backgroundColor: redColor1,
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Get Started',
                          style: textStyle8,
                        ),
                        Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Colors.white,
                          size: width * 0.1,
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ))));
  }
}
