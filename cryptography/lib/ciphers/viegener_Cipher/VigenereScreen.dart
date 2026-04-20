import 'package:Cipherium/ciphers/viegener_Cipher/VigenereCipher.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Vigenerescreen extends StatefulWidget {
  const Vigenerescreen({super.key});

  @override
  State<Vigenerescreen> createState() => _VigenerescreenState();
}

class _VigenerescreenState extends State<Vigenerescreen> {
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
          "Vigenère Cipher",
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
                    "The Vigenere Cipher is a method of encryption that uses a repeating keyword to shift each letter in the text by different values. Unlike the Caesar Cipher, it applies multiple shifts, making it harder to break.\n\n"
                    "Encryption:\nE(xᵢ) = (xᵢ + kᵢ) mod 26\n"
                    "Decryption:\nD(xᵢ) = (xᵢ - kᵢ) mod 26\n\n"
                    "Each letter is converted to a number (0–25), and the key is repeated to match the text length. The modulo operation ensures the alphabet wraps around.\n\n"
                    "Although stronger than simple ciphers, it is not secure by modern standards.",
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
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter key";
                      }
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return "Key must contain letters only";
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
                              result = vigenereEncrypt(
                                textController.text,
                                keyController.text,
                              );
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
                              result = vigenereDecrypt(
                                textController.text,
                                keyController.text,
                              );
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
