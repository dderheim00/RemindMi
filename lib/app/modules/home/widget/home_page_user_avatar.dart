import 'package:flutter/material.dart';
import 'package:remindmi/app/components/custom_network_image.dart';

class HomePageUserAvatar extends StatelessWidget {
  const HomePageUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 24,
        width: 24,
        color: Colors.blue,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomCachedNetworkImage(
              url: "https://image.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg",
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}