import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_portfolio_website/data/footer_items.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
      tablet: _buildUi(tabletMaxWidth, context),
      desktop: _buildUi(desktopMaxWidth, context),
    );
  }

  Widget _buildUi(double maxWidth, BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: _buildFooterItems(constraints, context),
                  ),
                  const SizedBox(height: 20),
                  _buildFooterText(context),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFooterItems(BoxConstraints constraints, BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: footerItems.map((footerItem) {
        return SizedBox(
          height: 150,
          width: ScreenHelper.isMobile(context)
              ? constraints.maxWidth / 2 - 10
              : constraints.maxWidth / 4 - 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(footerItem.iconPath, width: 30),
                  const SizedBox(width: 15),
                  Text(
                    footerItem.title,
                    style: GoogleFonts.oswald(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${footerItem.text1}\n',
                      style: const TextStyle(
                        color: Colors.white,
                        height: 1.8,
                      ),
                    ),
                    TextSpan(
                      text: '${footerItem.text2}\n',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFooterText(BuildContext context) {
    final bool isMobile = ScreenHelper.isMobile(context);
    final double fontSize = isMobile ? 13.0 : 16.0;

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Copyright (c) 2024 Ritik Shah. All rights reserved.',
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFooterLink('Privacy Policy', fontSize),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
            ),
            _buildFooterLink('Terms & Conditions', fontSize),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text, double fontSize) {
    return GestureDetector(
      onTap: () {},
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}
