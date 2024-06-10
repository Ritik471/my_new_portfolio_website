import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<MaterialColor> colorizeColors = [
    Colors.amber,
    Colors.purple,
    Colors.cyan,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: _buildUi(desktopMaxWidth, context),
        tablet: _buildUi(tabletMaxWidth, context),
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
      );

  Widget _buildUi(double width, BuildContext context) {
    bool isMobile = ScreenHelper.isMobile(context);
    double imageSize = isMobile ? 400 : 600;
    double nameFontSize = isMobile ? 45 : 55;
    double animatedTextFontSize = isMobile ? 28 : 45;
    double textImFontSize = isMobile ? 26 : 43;
    double downloadCvFontSize = isMobile ? 25 : 25;
    double minidescriptionFontSize = isMobile ? 22 : 28;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1500),
          child: LayoutBuilder(
            builder: (context, constraints) => Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: isMobile ? width * 0.9 : width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        helloTag,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: nameFontSize,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'I\'m',
                              style: TextStyle(
                                fontFamily: 'Horizon',
                                fontSize: textImFontSize,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Horizon',
                                fontSize: animatedTextFontSize,
                                color: Colors.white,
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  TyperAnimatedText('Passionate'),
                                  TyperAnimatedText('Hard Working'),
                                  TyperAnimatedText('Flutter Developer'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          minidescription,
                          style: TextStyle(
                            fontSize: minidescriptionFontSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 3,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            ColorizeAnimatedText(
                              'Download CV',
                              textStyle: TextStyle(
                                fontSize: downloadCvFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              colors: colorizeColors,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                isMobile ? const SizedBox(height: 20) : const SizedBox(width: 40),
                Expanded(
                  flex: isMobile ? 0 : 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: DropShadowImage(
                        image: Image.asset(
                          'assets/photo.jpg',
                          height: imageSize,
                          width: imageSize,
                        ),
                        offset: const Offset(0, 3),
                        blurRadius: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
