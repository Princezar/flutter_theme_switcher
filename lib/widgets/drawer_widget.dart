import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app_flutter_course/widgets/vertical_spacing_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
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
            ListTile(
              leading: Icon(IconlyBold.home),
              title: Text("Home",
              style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),

    );
  }
}
