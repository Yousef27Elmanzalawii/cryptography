import 'package:Cipherium/ciphers/Hill_cipher/HillTwoscreen.dart';
import 'package:Cipherium/ciphers/Hill_cipher/HillthreeScreen.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hillscreen extends StatefulWidget {
  const Hillscreen({super.key});

  @override
  State<Hillscreen> createState() => _HillscreenState();
}

class _HillscreenState extends State<Hillscreen> {
  @override
  int selectedIndex = 0;
  List<Widget> screens = [HillTwoScreen(), HillThreeScreen()];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Appcolors.primaryColor,
        unselectedItemColor: Colors.white54,
        backgroundColor: Appcolors.backgroundColor,

        selectedLabelStyle: GoogleFonts.spaceMono(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.spaceMono(fontSize: 13),
        onTap: (val) {
          setState(() {
            selectedIndex = val;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two_outlined),
            label: "2*2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3_outlined),
            label: "3*3",
          ),
        ],
      ),

      body: screens[selectedIndex],
    );
  }
}
