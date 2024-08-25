import 'package:flutter/material.dart';
import 'package:niransnarayanan/utils/responsive.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 128 * Responsive.paddingScaleFactor,
        top: 32.0 * Responsive.paddingScaleFactor,
        bottom: 16.0 * Responsive.paddingScaleFactor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Spacer(),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "# ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.orange,
                  ),
                ),
                TextSpan(
                  text: text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "FiraCode",
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8.0 * Responsive.paddingScaleFactor,
          ),
          Center(
            child: Container(
              height: 1.0,
              width: 100,
              color: Colors.orange,
            ),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
