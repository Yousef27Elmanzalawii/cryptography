import 'package:Cipherium/ciphers/Hill_cipher/HillTwoXTwo.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HillTwoScreen extends StatefulWidget {
  const HillTwoScreen({super.key});

  @override
  State<HillTwoScreen> createState() => _HillTwoScreenState();
}

class _HillTwoScreenState extends State<HillTwoScreen> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  final keyController = TextEditingController();

  final keyController2 = TextEditingController();

  final keyController3 = TextEditingController();

  final keyController4 = TextEditingController();

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
          "Hill Cipher",
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
                    "The Hill Cipher is a polygraphic substitution cipher that uses matrix multiplication to encrypt pairs of letters.\n\n"
                    "Encryption:\n"
                    "C = K × P (mod 26)\n\n"
                    "Where:\n"
                    "K = 2×2 Key Matrix\n"
                    "P = Plaintext Vector\n"
                    "C = Ciphertext Vector\n\n"
                    "Key Matrix:\n"
                    "[ a  b ]\n"
                    "[ c  d ]\n\n"
                    "Ciphertext Equations:\n"
                    "C1 = (a×x + b×y) mod 26\n"
                    "C2 = (c×x + d×y) mod 26\n\n"
                    "Decryption:\n"
                    "P = K⁻¹ × C (mod 26)\n\n"
                    "The determinant must satisfy:\n"
                    "gcd(det(K), 26) = 1\n\n"
                    "to ensure the matrix has an inverse for decryption.",
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: keyController,
                          style: GoogleFonts.spaceMono(color: Colors.white),
                          cursorColor: Appcolors.primaryColor,

                          decoration: InputDecoration(
                            labelText: "First Key",
                            labelStyle: GoogleFonts.spaceMono(
                              color: Colors.white,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
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
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: keyController2,
                          style: GoogleFonts.spaceMono(color: Colors.white),
                          cursorColor: Appcolors.primaryColor,

                          decoration: InputDecoration(
                            labelText: "Second Key",
                            labelStyle: GoogleFonts.spaceMono(
                              color: Colors.white,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
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
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: keyController3,
                          style: GoogleFonts.spaceMono(color: Colors.white),
                          cursorColor: Appcolors.primaryColor,

                          decoration: InputDecoration(
                            labelText: "Third Key",
                            labelStyle: GoogleFonts.spaceMono(
                              color: Colors.white,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
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
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: keyController4,
                          style: GoogleFonts.spaceMono(color: Colors.white),
                          cursorColor: Appcolors.primaryColor,

                          decoration: InputDecoration(
                            labelText: "Fourth Key",
                            labelStyle: GoogleFonts.spaceMono(
                              color: Colors.white,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Appcolors.primaryColor,
                              ),
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
                      ),
                    ],
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
                              int key2 = int.parse(keyController2.text);
                              int key3 = int.parse(keyController3.text);
                              int key4 = int.parse(keyController4.text);
                              result = HillCipher2x2.encrypt(
                                textController.text,
                                [
                                  [key, key2],
                                  [key3, key4],
                                ],
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
                              int key = int.parse(keyController.text);
                              int key2 = int.parse(keyController2.text);
                              int key3 = int.parse(keyController3.text);
                              int key4 = int.parse(keyController4.text);

                              result = HillCipher2x2.decrypt(
                                textController.text,
                                [
                                  [key, key2],
                                  [key3, key4],
                                ],
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
                        keyController2.clear();
                        keyController3.clear();
                        keyController4.clear();
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
