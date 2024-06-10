import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_portfolio_website/data/footer_items.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) => ScreenHelper(
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUi(tabletMaxWidth, context),
        desktop: _buildUi(desktopMaxWidth, context),
      );

  Widget _buildUi(double maxWidth, BuildContext context) => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal padding for centering
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60,),
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: footerItems
                            .map(
                              (footerItem) => SizedBox(
                                height: 150,
                                width: ScreenHelper.isMobile(context)
                                    ? constraints.maxWidth / 2 - 20
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
                                              color:Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Flex(
                      direction: ScreenHelper.isMobile(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      mainAxisAlignment: ScreenHelper.isMobile(context)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Copyright (c) 2024 Ritik Shah. All rights reserved.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: const Text(
                                '|',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  'Terms & Conditions',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ),
      );
}
