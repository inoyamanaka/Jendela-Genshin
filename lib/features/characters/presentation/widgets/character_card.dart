import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genshin_app/features/characters/presentation/pages/detail_character_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.name,
    required this.imgChar,
    required this.background,
    super.key,
  });
  final String name;
  final String imgChar;
  final String background;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const DetailCharacterPage(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              // color: Colors.grey,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: background,
            ),
          ),
          Positioned(
            top: 1,
            bottom: 5,
            left: 25,
            right: 5,
            child: CachedNetworkImage(
              imageUrl: imgChar,
            ),
          ),
          Positioned(
            // top: 15,
            bottom: 35,
            left: 10,
            child: Text(
              name,
              style: GoogleFonts.inriaSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
