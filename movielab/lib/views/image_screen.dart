import 'package:flutter/material.dart';
import '../../tools/border.dart';
import '../../views/show_screen.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    super.key,
    required this.image,
    required this.hero,
  });
  final String image;
  final String hero;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ShowScreen()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: hero,
          child: ClipRRect(
            borderRadius: getBorderRadiusWidget(context, 0.05),
            child: Image.asset(
              image,
              width: width,
              height: height * 0.6,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
