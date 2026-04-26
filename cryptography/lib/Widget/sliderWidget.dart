import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sliderWidget extends StatelessWidget {
  const sliderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.page,
  });
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
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 170,
                    width: double.infinity,
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
                      fontSize: 20,
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
