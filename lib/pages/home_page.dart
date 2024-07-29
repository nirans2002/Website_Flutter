import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:niransnarayanan/utils/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AdaptiveNavBar(
        screenWidth: screenWidth,
        elevation: 0,
        title: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/Union.png"),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Niran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        navBarItems: [
          NavBarItem(
            text: "home",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "works",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "about-me",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "contacts",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
        ],
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // NavigationRail(destinations: [],),
          const SideRail(),
          const Spacer(),
          _buildWideContainers(mediaQueryData),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildNormalContainer() {
    return Center(
      child: SizedBox(
        height: 100.0,
        width: 100.0,
        // color: Colors.red,
        child: ElevatedButton(
          child: const Text("helllo"),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildWideContainers(mediaQueryData) {
    // final mediaQueryData = MediaQuery.of(context);

    // var mediaQueryData;
    return Center(
      child: mediaQueryData.size.width > 800
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "I am ",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "web developer ",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "and\n",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "front-end developer",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        )),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 64, horizontal: 8),
                        child: Text(
                          "He crafts responsive websites where technologies \nmeet creativity",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Contact me !!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/sample_pic.png")),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/sample_pic.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "I am ",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "web developer ",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "and\n",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "front-end developer",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        )),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 64, horizontal: 8),
                        child: Text(
                          "He crafts responsive websites where technologies \nmeet creativity",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Contact me !!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class SideRail extends StatelessWidget {
  const SideRail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              // child: const Text(" "),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/Github.png"),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/Github.png"),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/Github.png"),
          ),
          const Spacer(),
          Image.asset("assets/images/dots.png"),
          const Spacer(),
        ],
      ),
    );
  }
}
