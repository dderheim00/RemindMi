import 'package:flutter/material.dart';
import 'package:remindmi/app/modules/home/widget/home_page_user_avatar.dart';
import 'package:remindmi/constants/images.dart';

class HomePageTaskCard extends StatelessWidget {
  const HomePageTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(16),

        child: Row(
          children: [
            Image.asset(
              Images.remindmiIcon,
              height: 42,
              width: 42,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '10:00 Am 18/12/2022',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Home Work',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Nulla protasdjahskfjdh kasjdhfsadgf kasdjfh',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  HomePageUserAvatar()
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 218, 218, 218),
              blurRadius: 10,
              offset: Offset(0,4),
            )
          ]
        ),
      ),
    );
  }
}