import 'package:flutter/material.dart';
import 'package:niransnarayanan/components/custom_navbar.dart';
import 'package:niransnarayanan/components/test_container.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({
    super.key,
  });
  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customNavBar(context),
      body: const BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // testContainer("side rail row 1", Colors.green, context),
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
          ),
          Row(
            children: [
              testContainer(
                  text: "text", color: Colors.amber, context: context),
            ],
          )
        ],
      ),
    );
  }
}
