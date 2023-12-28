import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_screen extends StatelessWidget {
  Intro_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "welcome search engine app",
              body: "we have Search engine like google",
              image: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/google.gif"),
                  ),
                ),
              ),
            ),
            PageViewModel(
                title: "welcome search engine app",
                image: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/yahoo.gif"),
                    ),
                  ),
                ),
                body: "we have Search engine like Yahoo"),
            PageViewModel(
              title: "welcome search engine app",
              body: "we have search engine like bing",
              image: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bing.png"),
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: "welcome search engine app",
              body: "we have search engine like Duck Duck go",
              image: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/duck duck go.gif"),
                  ),
                ),
              ),
            ),
          ],
          done: Text("done"),
          onDone: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setBool('IsIntroVisited', true);
            Navigator.pushReplacementNamed(context, "HomePage");
          },
          next: Text("next"),
          showNextButton: true,
          skip: Text("skip"),
          onSkip: () {
            Navigator.pushReplacementNamed(context, "HomePage");
          },
          showSkipButton: true,
        ),
      ),
    );
  }
}
