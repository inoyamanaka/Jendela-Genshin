import 'package:flutter/material.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
import 'package:genshin_app/features/home/presentation/pages/home.dart';
import 'package:genshin_app/features/interactive_map/presentation/pages/interactive_map_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = ValueNotifier<int>(0);
    final listPages = [
      const HomePage(),
      const InteractiveMapPage(),
      // const CharacterPage(),
      // const EventPage(),
      // const HomePage(),
      // const HomePage(),
    ];
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (context, value, child) => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: currentIndex.value,
          children: listPages,
        ),
        bottomNavigationBar: SalomonBottomBar(
          backgroundColor: GenshinColors.blackPrimary,
          currentIndex: currentIndex.value,
          onTap: (p0) {
            currentIndex.value = p0;
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              selectedColor: Colors.white,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.map_sharp),
              title: const Text('Map'),
              selectedColor: Colors.white,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.schedule),
              title: const Text('Schedule'),
              selectedColor: Colors.white,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
