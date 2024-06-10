import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_portfolio_website/data/educations.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:my_new_portfolio_website/widgets/screen_helper.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});
  
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
}

Widget _buildUi(double width, BuildContext context) {
  return SingleChildScrollView(
    child: Center(
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        constraints: const BoxConstraints(
          maxWidth: 1500, // Maximum width for desktop view
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'EDUCATION',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    education,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: educations.map((education) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20,), // Space between cards
                    child: SizedBox(
                      width: constraints.maxWidth / (ScreenHelper.isMobile(context) ? 1 : 2) - 20,
                      child: Card(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                education.period,
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                education.description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                education.college,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(), // Convert the Iterable to a List
              );
            }),
            const SizedBox(height: 40), // Space between sections
            // New Heading Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'INTERNSHIPS',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: List.generate(1, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20,), // Space between cards
                    child: SizedBox(
                      width: constraints.maxWidth - 20,
                      child: Card(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Web Development Intern in WORDPRESS',
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Fuerte Developers (May 2023 - July 2023)',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Acquired proficiency in utilizing WordPress plugins and themes through hands-on experience with cloned and live projects.',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(), // Generate a list of cards
              );
            }),
            const SizedBox(height: 40), // Space at the end of the page
          ],
        ),
      ),
    ),
  );
}
