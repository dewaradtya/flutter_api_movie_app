import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Tooltip(
              message: 'Home',
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {},
                  hoverColor: Colors.red,
                ),
              ),
            ),
            Tooltip(
              message: 'Search',
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                  hoverColor: Colors.red,
                ),
              ),
            ),
            Tooltip(
              message: 'Favorites',
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {},
                  hoverColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
