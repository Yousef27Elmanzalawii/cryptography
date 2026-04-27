import 'package:Cipherium/models/AppColors.dart';
import 'package:Cipherium/pages/CiphersPage.dart';
import 'package:Cipherium/pages/HomeContent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  List<Widget> screens = [HomeContent(), CipherPage()];
  @override
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
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_encryption_outlined),
            label: "Ciphers",
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 75,
        elevation: 1,
        backgroundColor: Appcolors.backgroundColor,

        title: Text(
          "Cipherium",
          style: GoogleFonts.spaceMono(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Appcolors.primaryColor,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff000A09),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(
                "assets/CrptoImg/CipheriumEdited.jpg",
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Cipherium",
                  style: GoogleFonts.spaceMono(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 7),
                Icon(Icons.key_outlined, color: Appcolors.textColor, size: 28),
              ],
            ),
            SizedBox(height: 10),
            Divider(indent: 40, endIndent: 40),
            SizedBox(height: 10),
            ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.home_outlined),
              title: Text(
                "Home",
                style: GoogleFonts.spaceMono(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.no_encryption_outlined),
              title: Text(
                "Ciphers",
                style: GoogleFonts.spaceMono(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
