import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AdaptiveNavBar(
        screenWidth: screenWidth,
        elevation: 0,
        title: const Text('Niran'),
        navBarItems: [
          NavBarItem(
            text: "Home",
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormalContainer();
          }
        },
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

  Widget _buildWideContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: const Color(0xFF282C33),
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
