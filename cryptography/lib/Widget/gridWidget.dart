import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class gridWidget extends StatelessWidget {
  const gridWidget({super.key, required this.image, required this.title, required this.page});
  final String image;
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ),
        );
      },
      child: Container(
        height: 170,
        width: 170,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 170,
                    width: 170,
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: GoogleFonts.spaceMono(
                      color: Colors.white,
                      fontSize: 17,
                      shadows: [
                        Shadow(offset: Offset(-1, -1), color: Colors.black),
                        Shadow(offset: Offset(1, -1), color: Colors.black),
                        Shadow(offset: Offset(1, 1), color: Colors.black),
                        Shadow(offset: Offset(-1, 1), color: Colors.black),
                      ],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
