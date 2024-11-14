import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';
import 'package:flutter_application_1/utils/text/textcustom.dart';

class ItemBestFromYou extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String bedroom;
  final String bathroom;
  const ItemBestFromYou({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.bedroom,
    required this.bathroom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: psWidth(5), vertical: psHeight(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(psHeight(10)),
              child: Image.asset(
                image,
                width: psWidth(74),
                height: psHeight(70),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: psWidth(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: title,
                  fontSize: psHeight(16),
                  fontWeight: FontWeight.w500,
                ),
                TextCustom(
                  text: description,
                  fontSize: psHeight(12),
                  color: AppColor.blueMain,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bedroom_child_rounded, size: psHeight(16), color: AppColor.textfind,),
                        SizedBox(width: psWidth(5),),
                        TextCustom(text: bedroom, fontSize: psHeight(12), color: AppColor.textfind,)
                      ],
                    ),
                    SizedBox(width: psWidth(20),),
                    Row(
                      children: [
                        Icon(Icons.bathtub_outlined, size: psHeight(16), color: AppColor.textfind,),
                        SizedBox(width: psWidth(5),),
                        TextCustom(text: bathroom, fontSize: psHeight(12), color: AppColor.textfind,)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
