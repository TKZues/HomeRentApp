import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/src/screen/home/homedetail/homedetail.dart';
import 'package:flutter_application_1/src/screen/home/homescreen/itembestforyou.dart';
import 'package:flutter_application_1/src/screen/home/homescreen/itemnearformyou.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';
import 'package:flutter_application_1/utils/text/textcustom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: psWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          text: "Location",
                          fontWeight: FontWeight.w400,
                          fontSize: psHeight(12),
                        ),
                        Row(
                          children: [
                            TextCustom(
                              text: "Jakarta",
                              fontSize: psHeight(20),
                              fontWeight: FontWeight.w500,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: psHeight(24),
                            )
                          ],
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Icon(Icons.notifications_none_outlined,
                            size: psHeight(24)),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: psWidth(8),
                            height: psWidth(8),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: psHeight(20),
                ),
                initializeSearch(),
                SizedBox(
                  height: psHeight(20),
                ),
                initializeCategories(),
                SizedBox(
                  height: psHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: "Near from you",
                      fontSize: psHeight(16),
                      fontWeight: FontWeight.w500,
                    ),
                    TextCustom(
                      text: "See more",
                      fontSize: psHeight(12),
                      color: AppColor.greyfind,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(
                  height: psHeight(20),
                ),
                initializenearfromyear(),
                SizedBox(
                  height: psHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: "Best for you",
                      fontSize: psHeight(16),
                      fontWeight: FontWeight.w500,
                    ),
                    TextCustom(
                      text: "See more",
                      fontSize: psHeight(12),
                      color: AppColor.greyfind,
                    )
                  ],
                ),
                SizedBox(
                  height: psHeight(10),
                ),
                initializebestfromyear()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row initializeSearch() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                size: psHeight(16),
              ),
              prefixIconColor: AppColor.greyfind,
              fillColor: AppColor.textfieldgrey,
              contentPadding: const EdgeInsets.only(
                left: 8,
                bottom: 0,
                top: 0,
                right: 2,
              ),
              hintText: "Search address, or near you ",
              hintStyle:
                  TextStyle(color: AppColor.greyfind, fontSize: psHeight(12)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: psWidth(10),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: psWidth(12), vertical: psHeight(12)),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xffA0DAFB),
                    Color(0xff0A8ED9),
                  ],
                  tileMode: TileMode.mirror,
                ),
                borderRadius: BorderRadius.circular(psHeight(10))),
            child: Padding(
                padding: EdgeInsets.all(psHeight(4)),
                child: Icon(
                  Icons.dashboard_customize_outlined,
                  size: psHeight(16),
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }

  List<String> categories = [
    "House",
    "Aparmant",
    "Hotel",
    "Villa",
  ];

  Container initializeCategories() {
    return Container(
      padding: const EdgeInsets.all(1),
      height: psHeight(41),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: psWidth(5)),
            padding: EdgeInsets.symmetric(horizontal: psWidth(10)),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xffA0DAFB),
                  Color(0xff0A8ED9),
                ],
                tileMode: TileMode.mirror,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.blueMain.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(psHeight(10)),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: psHeight(12),
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }

  Container initializenearfromyear() {
    return Container(
      padding: const EdgeInsets.all(1),
      height: psHeight(272),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ItemNearFromYou(
            image: "assets/images/house1.jpg",
            title: "Dreamsville House",
            description: "Jl. Sultan Iskandar Muda",
            distance: "1.8 km",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeDetail(
                      image: "assets/images/house2.jpg",
                      title: "Dreamsville House",
                      description:
                          "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...",
                      bedroom: "6 Bedroom",
                      bathroom: "4 Bathroom",
                      address: "Jl. Sultan Iskandar Muda",
                      price: "Rp. 2.500.000.000 / Year",
                    ),
                  ));
            },
          );
        },
      ),
    );
  }

  Container initializebestfromyear() {
    // ignore: sized_box_for_whitespace
    return Container(
      height: psHeight(200),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ItemBestFromYou(
            image: "assets/images/house1.jpg",
            title: "Orchad House",
            description: "Rp. 2.500.000.000 / Year",
            bedroom: "6 Bedroom",
            bathroom: "4 Bathroom",
          );
        },
      ),
    );
  }
}
