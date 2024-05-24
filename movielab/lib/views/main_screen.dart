import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movielab/views/auth_screens/auth_begin_screen.dart';
import 'list_events_screen.dart'; // Import the new events list screen
import '../../views/show_screen.dart';
import '../../views/list_news_screen.dart';
import '../../tools/border.dart';
import '../../tools/colors.dart';
import '../tools/styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: redColor1,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  backGroundColor1,
                  backGroundColor2,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(width * 0.02),
                          decoration: BoxDecoration(
                            color: redColor1,
                            borderRadius: getBorderRadiusWidget(context, 1),
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade200,
                            size: width * 0.07,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const AuthScreen()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.005,
                              horizontal: width * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: redColor1,
                              borderRadius: getBorderRadiusWidget(context, 0.1),
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(width * 0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        getBorderRadiusWidget(context, 1),
                                  ),
                                  child: const Icon(
                                    Icons.logout,
                                    color: redColor1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Center(
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.06,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: getBorderRadiusWidget(context, 0.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: width * 0.08,
                              ),
                              SizedBox(width: width * 0.02),
                              const Text(
                                'Search',
                                style: textStyle12,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.menu_outlined,
                            color: Colors.grey,
                            size: width * 0.07,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Upcoming Events', style: textStyle2),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListEventsScreen()),
                            );
                          },
                          child: const Text('See all', style: textStyle11),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        EventContainer(
                          title: 'Event 1',
                          description: 'Description 1',
                        ),
                        EventContainer(
                          title: 'Event 2',
                          description: 'Description 2',
                        ),
                        EventContainer(
                          title: 'Event 3',
                          description: 'Description 3',
                        ),
                        EventContainer(
                          title: 'Event 4',
                          description: 'Description 4',
                        ),
                      ],
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
                        const Text('About Show', style: textStyle2),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const ShowScreen()),
                            );
                          },
                          child: const Text('See all', style: textStyle11),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.055),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              /*
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SecondScreen()),
                              );
                              */
                            },
                            child: Hero(
                              tag: 'pic',
                              child: GameOverViewWidget(
                                width: width,
                                height: height,
                                imageName: 'assets/img/mainPoster.jpg',
                                name: 'Money Heist',
                                star: '4.8',
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        const Text('News', style: textStyle2),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const ListNewsScreen()),
                            );
                          },
                          child: const Text('See all', style: textStyle11),
                        ),
                      ],
                    ),
                  ),
                  NewGamesWidget(
                    width: width,
                    height: height,
                    name:
                        'Berlino, la serie tv dedicata al più amato dei ladri della Casa di Carta, è in linea e vuole che tu ti diverta un mondo a guardarla',
                    imageName: 'assets/img/berlin.jpg',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EventContainer extends StatelessWidget {
  final String title;
  final String description;

  const EventContainer({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.006,
        horizontal: width * 0.02,
      ),
      decoration: BoxDecoration(
        color: redColor2,
        borderRadius: getBorderRadiusWidget(context, 1),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.event,
            color: redColor1,
          ),
          SizedBox(width: width * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textStyle13,
              ),
              Text(
                description,
                style: textStyle6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewGamesWidget extends StatelessWidget {
  const NewGamesWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imageName,
    required this.name,
  });

  final double width;
  final double height;
  final String imageName;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width * 0.9,
        height: height * 0.16,
        padding: EdgeInsets.only(
          left: width * 0.02,
          top: height * 0.01,
          bottom: height * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: getBorderRadiusWidget(context, 0.05),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: getBorderRadiusWidget(context, 0.05),
                child: Image.asset(
                  imageName,
                  width: width * 0.4,
                  height: height,
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textStyle4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      'Trending',
                      style: textStyle5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.15,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.011,
                            vertical: height * 0.006,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: getBorderRadiusWidget(context, 1),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                '5h. ago',
                                style: textStyle14,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: getShapeWidget(context, 1),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Read',
                            style: textStyle13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameOverViewWidget extends StatelessWidget {
  const GameOverViewWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imageName,
    required this.name,
    required this.star,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageName;
  final String name;
  final String star;

  @override
  Widget build(BuildContext context) {
    // Adjusting the overall width and height to better fit within their parent.
    double adjustedWidth = width * 0.85; // Adjusted width to fit within screen
    double adjustedHeight = height * 0.3; // Reduced height

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      alignment: Alignment.bottomCenter,
      width: adjustedWidth,
      height: adjustedHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageName),
          fit: BoxFit.cover,
        ),
        borderRadius: getBorderRadiusWidget(context, 0.07),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(width * 0.07),
          bottomRight: Radius.circular(width * 0.07),
          topRight: Radius.circular(width * 0.01),
          topLeft: Radius.circular(width * 0.01),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          child: Container(
            width: adjustedWidth,
            height: height * 0.13,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: textStyle9,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Action',
                    style: textStyle10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: getBorderRadiusWidget(context, 1),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                              star,
                              style: textStyle10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: getShapeWidget(context, 1),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                            vertical: height * 0.005,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Watch',
                          style: textStyle13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
