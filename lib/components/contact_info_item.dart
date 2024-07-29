import 'package:flutter/material.dart';

class ContactInfoItem extends StatelessWidget {
  const ContactInfoItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {},
        onHover: null,
        child: Row(
          children: [
            Icon(icon),
            Text("  $text"),
          ],
        ),
      ),
    );
  }
}