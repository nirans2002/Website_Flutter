import 'package:flutter/material.dart';

class ContactMeButton extends StatelessWidget {
  const ContactMeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Contact me !!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
