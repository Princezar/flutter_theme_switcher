import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/screens/home_screen.dart';
import 'package:provider/provider.dart';
//providers
import 'consts/theme_data.dart';
import 'providers/theme_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Need it to access the theme provider
  ThemeProvider themeChangeProvider = ThemeProvider();


  @override
  void initState() {
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme()  async {
    themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_){
        //Notify about theme changes
        return themeChangeProvider;
      }),
    ],
      child: Consumer<ThemeProvider>(builder: (context, themeChangeProvider, ch){
        return MaterialApp(

          debugShowMaterialGrid: false,
          title: 'Blog',
          theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
          home: const HomeScreen(),
          routes: {},
        );
      },),
    );
  }
}





