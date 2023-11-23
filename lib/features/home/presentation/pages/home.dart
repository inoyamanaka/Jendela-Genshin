import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
import 'package:genshin_app/features/characters/presentation/pages/characters_page.dart';
import 'package:genshin_app/features/events/presentation/pages/event_page.dart';
import 'package:genshin_app/features/home/presentation/widgets/content_widget.dart';
import 'package:genshin_app/features/interactive_map/presentation/pages/interactive_map_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height -
          MediaQuery.of(context).padding.bottom,
      child: Scaffold(
        backgroundColor: GenshinColors.blackPrimary,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                      ),
                      const Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dedel Gaming',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Alllooooowww',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ContentWidget(
                  title: 'News',
                  image: 'assets/images/news_image.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const EventPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                ContentWidget(
                  title: 'Characters',
                  image: 'assets/images/character_image.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const CharacterPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                ContentWidget(
                  title: 'Nations',
                  image: 'assets/images/nation_image.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const InteractiveMapPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                ContentWidget(
                  title: 'Weapons',
                  image: 'assets/images/nation_image.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const InteractiveMapPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
