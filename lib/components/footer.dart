import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.github),
              onPressed: () {},
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onLongPress: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              "Developed by Niran S Narayanan",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w100,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
