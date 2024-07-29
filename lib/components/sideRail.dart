
import 'package:flutter/material.dart';

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
