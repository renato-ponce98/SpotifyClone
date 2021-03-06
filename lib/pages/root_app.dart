import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify_clone/pages/home_page.dart';
import 'package:spotify_clone/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        bottomNavigationBar: getFooter(),
        body: getBody());
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text("Library",
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
        Center(
          child: Text("Search",
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
        Center(
          child: Text("Settings",
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Feather.home,
      Feather.book,
      Feather.search,
      Feather.settings,
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: activeTab == index ? primary : white,
                ));
          }),
        ),
      ),
    );
  }
}
