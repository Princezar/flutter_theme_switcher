import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Container(),

      ),
    );
  }
}
