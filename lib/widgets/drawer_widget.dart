import 'package:flutter/material.dart';
import 'package:my_new_portfolio_website/data/header_items.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.itemController});

  final ItemScrollController itemController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  headerItems[index].title,
                  style: const TextStyle(color: kPrimaryColor),
                ),
                onTap: () {
                  itemController.scrollTo(
                    index: headerItems[index].index,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context); // Close drawer after navigation
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: headerItems.length,
          ),
        ),
      ),
    );
  }
}
