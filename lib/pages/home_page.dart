import 'package:flutter/material.dart';
import 'package:my_new_portfolio_website/pages/about_page.dart';
import 'package:my_new_portfolio_website/pages/education_page.dart';
import 'package:my_new_portfolio_website/pages/footer_page.dart';
import 'package:my_new_portfolio_website/pages/project_page.dart';
import 'package:my_new_portfolio_website/pages/skill_page.dart';
import 'package:my_new_portfolio_website/pages/welcome_page.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/utils/globals.dart';
import 'package:my_new_portfolio_website/widgets/drawer_widget.dart';
import 'package:my_new_portfolio_website/widgets/top_bar_contents.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [
    WelcomePage(),
    AboutPage(),
    ProjectPage(),
    EducationPage(),
    SkillPage(),
    FooterPage(),
  ];
  final itemScrollController = ItemScrollController();
  final pageController = PageController(initialPage: 0);
  final itemPositionlistener = ItemPositionsListener.create();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: TopBarContents(
          opacity: 0,
          itemScrollController: itemScrollController,
        ),
      ),
      endDrawer: DrawerWidget(itemController: itemScrollController),
      body: Container(
        color:kBackgroundColor,
        child: ScrollablePositionedList.builder(
            initialScrollIndex: 0,
            shrinkWrap: true,
            itemPositionsListener: itemPositionlistener,
            itemScrollController: itemScrollController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final page = pages[index];
              return page;
            },),
      ),
    );
  }
}
