import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/experience.dart';
import 'package:niransnarayanan/utils/responsive.dart';
import 'package:intl/intl.dart';

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({
    super.key,
    required this.experience,
  });

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    const defaultCompanyLogo =
        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRYmKYx2i4IZkKWKJYVUfnK7PwwBDd8JMaVtR7iiXfKyywIG9V8";
    String endDateText = experience.isCurrentlyWorking
        ? "Present"
        : DateFormat.yMMM().format(experience.startdate!);
    return Padding(
      padding: const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
      child: Container(
        // color: Colors.grey,
        // height: (getRandomHeight() % 5 + 1) * 50.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFF9900),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                  child: Image.network(experience.companyImgUrl != null
                      ? experience.companyImgUrl!
                      : defaultCompanyLogo),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                    ),
                  ),
                  // divider
                  // Container(
                  //   height: 1.0,
                  //   width: 500 * Responsive.paddingScaleFactor,
                  //   color: Colors.grey,
                  // ),
                  Text(
                    experience.companyName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${DateFormat.yMMM().format(experience.startdate!)} - $endDateText" +
                        " | " +
                        experience.employmentType!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// divider
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Container(
//     height: 1.0,
//     width: double.infinity,
//     color: Colors.grey,
//   ),
// ),