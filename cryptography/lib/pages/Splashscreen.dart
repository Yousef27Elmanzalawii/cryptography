import 'package:Cipherium/models/AppColors.dart';
import 'package:Cipherium/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Homepage();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: Column(
        children: [
          SizedBox(height: 180),
          Center(
            child: Image.asset(
              "assets/CrptoImg/dddc74eccdec0c0e916565c660ef088f-removebg-preview.png",
              color: Color(0xff34D399),
              width: 250,
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Cipherium",
                style: GoogleFonts.spaceMono(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 7),
              Icon(Icons.key_outlined, color: Appcolors.textColor, size: 36),
            ],
          ),
          SizedBox(height: 25),
          Divider(
            endIndent: 50,
            indent: 50,
            thickness: 1,
            color: Appcolors.primaryColor,
          ),
          SizedBox(height: 20),
          Text(
            maxLines: 2,
            "Encode your thoughts. Decode the truth.",
            style: GoogleFonts.robotoFlex(fontSize: 16, color: Colors.white54),
          ),
          Spacer(),
          Text(
            "YM Team",
            style: GoogleFonts.spaceMono(
              fontSize: 22,

              fontWeight: FontWeight.bold,
              color: Appcolors.primaryColor,
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
