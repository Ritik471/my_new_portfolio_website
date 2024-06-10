import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_portfolio_website/data/projects.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/utils/utils.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(desktopMaxWidth, context),
      tablet: _buildUi(tabletMaxWidth, context),
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1500, // Maximum width for the content
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'PROJECTS',
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    height: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Text(
                        'These are my best projects built with love using Flutter',
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: projects
                          .map(
                            (project) => SizedBox(
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth
                                  : constraints.maxWidth / 2.0 - 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(project.image),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    project.description,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextButton.icon(
                                      onPressed: () => Utils.launchURL(project.gitLink),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                        ),
                                      ),
                                      icon: const FaIcon(
                                        FontAwesomeIcons.github,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      label: const Text(
                                        'GitHub',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ), // Added spacing at the end
              ],
            ),
          ),
        ),
      );
    },
  );
}
