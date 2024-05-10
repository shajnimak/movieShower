import 'package:flutter/material.dart';
import '../../views/list_stuff_screen.dart';
import '../../tools/border.dart';
import '../../views/image_screen.dart';
import '../../views/main_screen.dart';
import '../../tools/colors.dart';
import '../../tools/styles.dart';
import '../../views/list_actors_screen.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String desc =
        'Eight thieves take hostages and lock themselves in the Royal Mint of Spain as a criminal mastermind manipulates the police to carry out his plan';
    return Container(
      color: Color.fromARGB(255, 28, 33, 37),
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Hero(
                  tag: 'pic',
                  child: Image.asset(
                    'assets/img/mainPoster.jpg',
                    width: width,
                    height: height * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(width * 0.02),
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: getBorderRadiusWidget(context, 1),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: getBorderRadiusWidget(context, 1),
                        ),
                        child: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    height: height * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(width * 0.08),
                        topLeft: Radius.circular(width * 0.08),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                          vertical: height * 0.02,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: height * 0.004),
                              width: width * 0.2,
                              height: height * 0.01,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: getBorderRadiusWidget(context, 1),
                              ),
                            ),
                            Container(
                              width: width * 0.85,
                              height: height * 0.065,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              decoration: BoxDecoration(
                                borderRadius: getBorderRadiusWidget(context, 1),
                                color: Colors.grey.shade200,
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.remove_red_eye,
                                          color: redColor1),
                                      Text('100M', style: textStyle5),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star_rate_rounded,
                                          color: redColor1),
                                      Text('Rated', style: textStyle7),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.video_call, color: redColor1),
                                      Text('42min', style: textStyle5),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child:
                                  const Text('About Show', style: textStyle3),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.02),
                              child: Text(desc, style: textStyle11),
                            ),
                            sectionWithSeeAll(
                                context,
                                'Cast List',
                                ['lisboa.jpeg', 'berlin.jpeg', 'tokyo.jpeg'],
                                ['detail7', 'detail8', 'detail9'],
                                ListActorsScreen()),
                            SizedBox(height: height * 0.02),
                            sectionWithSeeAll(
                                context,
                                'Stuff List',
                                [
                                  'alex_pina.jpg',
                                  'esther.jpg',
                                  'jesus_colmenar.jpg'
                                ],
                                ['detail10', 'detail11', 'detail12'],
                                ListStuffScreen()), // Adjust screen name
                            SizedBox(height: height * 0.02),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: redColor1,
                                shape: getShapeWidget(context, 1),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.2,
                                    vertical: height * 0.015),
                              ),
                              onPressed: () {},
                              child: const Text('Watch', style: textStyle8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionWithSeeAll(BuildContext context, String title,
      List<String> imageNames, List<String> heroTags, Widget nextPage) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> images = List.generate(imageNames.length,
        (index) => buildHeroImage(context, imageNames[index], heroTags[index]));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: textStyle3),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => nextPage)),
                child: Text('See All',
                    style: textStyle11.copyWith(
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: images,
        ),
      ],
    );
  }

  Widget buildHeroImage(
      BuildContext context, String imageName, String heroTag) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ImageScreen(
              image: 'assets/img/$imageName',
              hero: heroTag,
            ),
          ),
        );
      },
      child: Hero(
        tag: heroTag,
        child: Image.asset(
          'assets/img/$imageName',
          width: width * 0.25,
          height: height * 0.12,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
