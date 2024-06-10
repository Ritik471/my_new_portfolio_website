import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(desktopMaxWidth, context),
      tablet: _buildUi(tabletMaxWidth, context),
      mobile: _buildMobileUi(context),
    );
  }

  Widget _buildMobileUi(BuildContext context) {
    return SingleChildScrollView(
      child: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
    );
  }

  Widget _buildUi(double width, BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1500, // Maximum width for the content
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final style = GoogleFonts.oswald(
                  color: Colors.white, fontSize: 25, height: 1.3);
              return Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 3,
                    child: Lottie.asset(
                      'assets/animations/coder.json',
                      width: ScreenHelper.isMobile(context) ? 450 : 400,
                    ),
                  ),
                  const SizedBox(
                    width: 40, 
                    height: 50,
                  ),
                  Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ABOUT ME',
                            style: GoogleFonts.oswald(
                              color: kPrimaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            aboutFirst,
                            textAlign: TextAlign.justify,
                            style: style,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            aboutSecond,
                            textAlign: TextAlign.justify,
                            style: style,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
