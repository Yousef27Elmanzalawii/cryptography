import 'package:Cipherium/ciphers/RSA_Cipher/RSAcipher.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RSAscreen extends StatefulWidget {
  const RSAscreen({super.key});

  @override
  State<RSAscreen> createState() => _RSAscreenState();
}

class _RSAscreenState extends State<RSAscreen> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  final keyController = TextEditingController();
  final keyController2 = TextEditingController();
  final keyContoroller3 = TextEditingController();

  RSA? rsa;

  List<BigInt> encryptedData = [];
  String result = "";
  String decryptedText = "";
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
          "RSA Cipher",
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
                    "The RSA Cipher is an asymmetric cryptographic algorithm that uses two keys: a public key for encryption and a private key for decryption.\n\n"
                    "Encryption:\n"
                    "C = M^e mod n\n\n"
                    "Decryption:\n"
                    "M = C^d mod n\n\n"
                    "Where:\n"
                    "p, q = two large prime numbers\n"
                    "n = p × q (modulus)\n"
                    "φ(n) = (p − 1)(q − 1)\n"
                    "e = public exponent (1 < e < φ(n))\n"
                    "d = private key such that (e × d) mod φ(n) = 1\n\n"
                    "Key Generation:\n"
                    "1. Choose two prime numbers p and q\n"
                    "2. Compute n = p × q\n"
                    "3. Compute φ(n) = (p − 1)(q − 1)\n"
                    "4. Choose e such that gcd(e, φ(n)) = 1\n"
                    "5. Compute d = modular inverse of e mod φ(n)\n\n"
                    "Encryption Process:\n"
                    "Each character of the plaintext is converted into a numeric value M.\n"
                    "Then encryption is applied using C = M^e mod n.\n\n"
                    "Decryption Process:\n"
                    "Each ciphertext value C is decrypted using M = C^d mod n to retrieve the original message.\n\n"
                    "Security:\n"
                    "The security of RSA depends on the difficulty of factoring large prime numbers to retrieve p and q from n.",
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: keyController,
                          style: GoogleFonts.spaceMono(color: Colors.white),
                          cursorColor: Appcolors.primaryColor,

                          decoration: InputDecoration(
                            errorMaxLines: 2,
                            labelText: "P Key",
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
                            if (!RSA.isPrime(int.parse(value))) {
                              return "Q must be prime";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: keyController2,
                          style: GoogleFonts.spaceMono(color: Colors.white),
                          cursorColor: Appcolors.primaryColor,

                          decoration: InputDecoration(
                            labelText: "Q Key",
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
                              return "Please enter key B";
                            }
                            if (int.tryParse(value) == null) {
                              return "Key must be a number";
                            }
                            if (int.parse(value) < 0) {
                              return "key must be positive";
                            }
                            if (!RSA.isPrime(int.parse(value))) {
                              return "P must be prime";
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: keyContoroller3,
                      style: GoogleFonts.spaceMono(color: Colors.white),
                      cursorColor: Appcolors.primaryColor,

                      decoration: InputDecoration(
                        labelText: "E Key",
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
                          return "Please enter key B";
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
                              int p = int.parse(keyController.text);
                              int q = int.parse(keyController2.text);
                              int e = int.parse(keyContoroller3.text);
                              result = RSA.encrypt(
                                textController.text,
                                p,
                                q,
                                e,
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
                            // setState(() {
                            //   int key = int.parse(keyController.text);
                            //   int key2 = int.parse(keyController2.text);
                            //   result = affineDecrypt(
                            //     textController.text,
                            //     key,
                            //     key2,
                            //   );
                            // });
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
                        keyContoroller3.clear();
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
