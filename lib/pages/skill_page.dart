import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_new_portfolio_website/data/skills_list.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

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
      padding: const EdgeInsets.only(bottom: 30), // Added bottom padding
      child: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
    );
  }

  Widget _buildUi(double width, BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1500,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                children: [
                  Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 2,
                    child: Lottie.asset(
                      'assets/animations/skills.json',
                      width: 500,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, bottom: 16),
                          child: Text(
                            'SKILLS',
                            style: GoogleFonts.oswald(
                              color: kPrimaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            skill,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: skills
                                .map(
                                  (skill) => Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: skill.percentage,
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 12),
                                            alignment: Alignment.centerLeft,
                                            height: 38,
                                            color: Colors.white,
                                            child: Text(
                                              skill.skill,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          flex: 100 - skill.percentage,
                                          child: const Divider(color: Colors.white),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          '${skill.percentage}%',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
