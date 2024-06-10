import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_portfolio_website/pages/home_page.dart';
import 'package:my_new_portfolio_website/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: name,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: Theme.of(context).copyWith(
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          canvasColor: kBackgroundColor,
          textTheme: GoogleFonts.aleoTextTheme(),
        ),
        builder: (context, widget) => ResponsiveBreakpoints.builder(
          child: widget!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1000, name: TABLET),
            const Breakpoint(start: 1001, end: 1200, name: DESKTOP),
            const Breakpoint(start: 1201, end: 2460, name: "4K"),
          ],
        ),
        home: const HomePage(),
      );
}
