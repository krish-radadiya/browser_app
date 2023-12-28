import 'package:flutter/material.dart';
import 'package:my_browerser/modules/app/connectivity_screen/provider/connectivity_provider.dart';
import 'package:my_browerser/modules/app/home_screen/views/HomePage.dart';
import 'package:my_browerser/modules/app/intro_screen/views/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/app/splesh_screen/views/Splash_screens.dart';
import 'modules/url_screen/model/url_model.dart';
import 'modules/url_screen/provider/url_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }

  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> bookmarkPageName = prefs.getStringList('bookmarkPageName') ?? [];
  List<String> bookmarkPageUrl = prefs.getStringList('bookmarkPageUrl') ?? [];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UrlProvider(
            urlModel: UrlModel(
              url: "https://www.google.com/",
              searchController: TextEditingController(),
              bookmarkPageName: bookmarkPageName,
              bookmarkPageUrl: bookmarkPageUrl,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splash_screens(),
          'intro': (context) => Intro_screen(),
          'HomePage': (context) => const HomePage(),
        },
      ),
    ),
  );
}
