import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app_flutter_course/widgets/vertical_spacing_widget.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); //them_provider declaration
    return Drawer(
      child: Material(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset('assets/images/newspaper.png',
                        height: 60,
                        width: 60,),
                    ),
                    const VerticalSpacing(20),
                    const Flexible(child: Text("News App"),
                    )
                  ],
                ),
            ),
            listTiles(
              icon: Icons.home,
                label: "Home",
                fct: (){},
            ),
            listTiles(
              icon: Icons.bookmark,
              label: "Bookmark",
              fct: (){},
            ),
            const Divider(thickness: 2,),
            SwitchListTile(
              title: Text(themeProvider.getDarkTheme ? 'Dark': 'Light',
              style: const TextStyle(fontSize: 20),
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: themeProvider.getDarkTheme,
              onChanged: (bool value){
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              },

            )
          ],
        ),
      ),

    );
  }
}


class listTiles extends StatelessWidget {
  const listTiles({Key? key, required this.label, required this.fct, required this.icon}) : super(key: key);

  final String label;
  final Function fct;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(icon,
      color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(label,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: (){
        fct();
      },
    );
  }
}

