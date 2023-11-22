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
            decoration: BoxDecoration(
              // color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(
                  background,
                ),
                fit: BoxFit.cover, // Atur sesuai kebutuhan Anda
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
          ),
          Positioned(
            top: 1,
            bottom: 5,
            left: 25,
            right: 5,
            child: Image.network(
              imgChar,
              scale: 0.3,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                // Menampilkan gambar alternatif ketika terjadi kesalahan
                if (error is NetworkImageLoadException &&
                    error.statusCode == 404) {
                  // Gambar tidak ditemukan, tampilkan gambar alternatif
                  return Image.network(
                    'https://static.vecteezy.com/system/resources/previews/024/658/986/non_2x/3d-male-character-holding-and-presenting-to-a-laptop-with-empty-screen-free-png.png',
                    scale: 0.3,
                  );
                } else {
                  return Image.network(
                    'https://static.vecteezy.com/system/resources/previews/024/658/986/non_2x/3d-male-character-holding-and-presenting-to-a-laptop-with-empty-screen-free-png.png',
                    scale: 0.3,
                  );
                }
              },
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
