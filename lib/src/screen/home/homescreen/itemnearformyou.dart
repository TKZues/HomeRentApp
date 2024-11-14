import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';
import 'package:flutter_application_1/utils/text/textcustom.dart';

class ItemNearFromYou extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String distance;
  final VoidCallback onTap;
  const ItemNearFromYou({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.distance, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: psWidth(222),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: psWidth(222),
                height: psHeight(272),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: psHeight(25),
              left: psWidth(10),
              child: TextCustom(
                text: title,
                fontSize: psHeight(16),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Positioned(
              bottom: psHeight(5),
              left: psWidth(10),
              child: TextCustom(
                text: description,
                fontSize: psHeight(12),
                color: AppColor.textd7,
              ),
            ),
            Positioned(
              top: psHeight(10),
              right: psWidth(10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: psWidth(8), vertical: psHeight(4)),
                decoration: BoxDecoration(color: Colors.black.withAlpha(40),borderRadius: BorderRadius.circular(psHeight(15))),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: psHeight(16),
                    ),
                    TextCustom(
                      text: distance,
                      fontSize: psHeight(12),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
