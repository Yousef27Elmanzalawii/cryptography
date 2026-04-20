import 'package:Cipherium/ciphers/caesar_Cipher/caesarCipher.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ceaserscreen extends StatefulWidget {
  Ceaserscreen({super.key});

  @override
  State<Ceaserscreen> createState() => _CeaserscreenState();
}

class _CeaserscreenState extends State<Ceaserscreen> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  final keyController = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.backgroundColor,
        title: Text(
          "Caesar Cipher",
          style: GoogleFonts.spaceMono(
            color: Appcolors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Appcolors.backgroundColor,
                border: Border.all(color: Appcolors.primaryColor, width: 0.5),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "The Caesar Cipher is a simple substitution cipher that shifts each letter in the alphabet by a fixed number (k). It was used by Julius Caesar and is one of the earliest encryption methods.\n\n"
                    "Encryption:\nE(x) = (x + k) mod 26\n\n"
                    "Decryption:\nD(x) = (x - k) mod 26\n\n"
                    "Letters are represented as numbers from 0 to 25, and the modulo operation ensures the alphabet wraps around. Although historically important, it is not secure today because it can be easily broken.",
                    style: GoogleFonts.spaceMono(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: GoogleFonts.spaceMono(color: Colors.white),
                    cursorColor: Appcolors.primaryColor,
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: "Enter the word",
                      labelStyle: GoogleFonts.spaceMono(color: Colors.white),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Appcolors.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Appcolors.primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter text";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: keyController,
                    style: GoogleFonts.spaceMono(color: Colors.white),
                    cursorColor: Appcolors.primaryColor,

                    decoration: InputDecoration(
                      labelText: "Enter Key",
                      labelStyle: GoogleFonts.spaceMono(color: Colors.white),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Appcolors.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Appcolors.primaryColor),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter key";
                      }
                       if (int.tryParse(value) == null) {
                        return "Key must be a number";
                      }
                      if (int.parse(value) < 0) {
                        return "key must be positive";
                      }

                     

                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.primaryColor,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              int key = int.parse(keyController.text);
                              result = caesarEncrypt(textController.text, key);
                            });
                          }
                          ;
                        },
                        child: Text(
                          "Encrypt",
                          style: GoogleFonts.spaceMono(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.primaryColor,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              int key = int.parse(keyController.text);
                              result = caesarDecrypt(textController.text, key);
                            });
                          }
                          ;
                        },
                        child: Text(
                          "Decrypt",
                          style: GoogleFonts.spaceMono(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                SizedBox(
                  width: 340,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        textController.clear();
                        keyController.clear();
                        result = '';
                      });
                    },

                    child: Text(
                      "Reset",
                      style: GoogleFonts.spaceMono(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Appcolors.backgroundColor,
                border: Border.all(color: Appcolors.primaryColor, width: 0.5),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: AlignmentGeometry.topCenter,
                    child: Text(
                      result,
                      style: GoogleFonts.spaceMono(
                        color: Colors.white,
                        height: 1.5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
