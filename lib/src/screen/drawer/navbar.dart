import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/src/screen/home/homescreen/homescreen.dart';
import 'package:flutter_application_1/src/screen/profile/social_screen.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
           HomeScreen(),
           SocialScreen(),
           SocialScreen(),
           SocialScreen(),
           SocialScreen(),
           SocialScreen(),
           SocialScreen(),
           SocialScreen(),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: AppColor.bluenavbar,
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              item(
                  Icon(
                    Icons.home,
                    size: psHeight(20),
                  ),
                  "Home", () {
                _pageController.jumpToPage(0);
              }, 0),
              item(
                  Icon(
                    Icons.person_outline_sharp,
                    size: psHeight(20),
                  ),
                  "Profile", () {
                _pageController.jumpToPage(1);
              }, 1),
              item(
                  Icon(
                    Icons.location_on_outlined,
                    size: psHeight(20),
                  ),
                  "Nearby", () {
                _pageController.jumpToPage(2);
              }, 2),
              Divider(
                color: Colors.white,
                thickness: 0.5,
                endIndent: psWidth(30),
              ),
              item(
                  Icon(
                    Icons.bookmark_border,
                    size: psHeight(20),
                  ),
                  "Bookmark", () {
                _pageController.jumpToPage(3);
              }, 3),
              item(
                  Icon(
                    Icons.notifications_none,
                    size: psHeight(20),
                  ),
                  "Notification", () {
                _pageController.jumpToPage(4);
              }, 4),
              item(
                  Icon(
                    Icons.chat_bubble_outline,
                    size: psHeight(20),
                  ),
                  "Message", () {
                _pageController.jumpToPage(5);
              }, 5),
              Divider(
                color: Colors.white,
                thickness: 0.5,
                endIndent: psWidth(30),
              ),
              item(
                  Icon(
                    Icons.settings,
                    size: psHeight(20),
                  ),
                  "Setting", () {
                _pageController.jumpToPage(6);
              }, 6),
              item(
                  Icon(
                    Icons.help_outline_sharp,
                    size: psHeight(20),
                  ),
                  "Help", () {
                _pageController.jumpToPage(7);
              }, 7),
              item(
                  Icon(
                    Icons.logout_outlined,
                    size: psHeight(20),
                  ),
                  "Logout", () {
              }, 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(Icon icon, String text, VoidCallback onTab, int index) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(psHeight(30)),
              topRight: Radius.circular(psHeight(30)))),
      child: ListTile(
        leading: icon,
        iconColor: selectedIndex == index ? AppColor.bluenavbar : Colors.white,
        title: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? AppColor.bluenavbar : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        tileColor: selectedIndex == index ? Colors.white : Colors.transparent,
        onTap: () {
          onTab();
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
