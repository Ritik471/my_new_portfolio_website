import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/utils/globals.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({
    super.key,
    required this.itemScrollController,
    required this.opacity,
    this.backgroundColor = topBarColor// Add background color parameter
  });

  final double opacity;
  final ItemScrollController itemScrollController;
  final Color backgroundColor; // Background color parameter

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final desktopHeader = PreferredSize(
      preferredSize: Size(screenSize.width, 70),
      child: DesktopTabBar(
        opacity: widget.opacity,
        itemScrollController: widget.itemScrollController,
        backgroundColor: widget.backgroundColor, // Pass background color
      ),
    );
    return ScreenHelper(
      desktop: desktopHeader,
      tablet: desktopHeader,
      mobile: buildMobileHeader(widget.itemScrollController, widget.backgroundColor), // Pass background color
    );
  }
}

class DesktopTabBar extends StatelessWidget {
  const DesktopTabBar({
    super.key,
    required this.opacity,
    required this.itemScrollController,
    required this.backgroundColor, // Background color parameter
  });

  final double opacity;
  final ItemScrollController itemScrollController;
  final Color backgroundColor; // Background color

  InkWell menuItem({required int toPage, required String title}) {
    return InkWell(
      onTap: () => itemScrollController.scrollTo(
        index: toPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor, // Use background color here
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(), // Use the updated HeaderLogo widget
            const Spacer(), // Add Spacer to push menu items to the right
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                menuItem(toPage: 0, title: 'Home'),
                const SizedBox(width: 24),
                menuItem(toPage: 1, title: 'About Me'),
                const SizedBox(width: 24),
                menuItem(toPage: 2, title: 'My Projects'),
                const SizedBox(width: 24),
                menuItem(toPage: 3, title: 'Education'),
                const SizedBox(width: 24),
                menuItem(toPage: 4, title: 'My Skills'),
                const SizedBox(width: 24),
                menuItem(toPage: 5, title: 'Contact Me'),
              ],
            ),
            const Spacer(), // Add Spacer to center the menu items
          ],
        ),
      ),
    );
  }
}

Widget buildMobileHeader(ItemScrollController itemScrollController, Color backgroundColor) => Container(
      color: backgroundColor, // Use background color here
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderLogo(),
              GestureDetector(
                onTap: () => Globals.scaffoldKey.currentState!.openEndDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Image.asset('assets/sidelogo.jpg',height:150,),
    );
  }
}
