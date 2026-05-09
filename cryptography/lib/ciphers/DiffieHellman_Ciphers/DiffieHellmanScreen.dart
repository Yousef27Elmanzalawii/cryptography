import 'package:Cipherium/ciphers/DiffieHellman_Ciphers/DiffieHellmanCipher.dart';
import 'package:Cipherium/ciphers/RailFence_Cipher/RailFenceCipher.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Diffiehellmanscreen extends StatefulWidget {
  const Diffiehellmanscreen({super.key});

  @override
  State<Diffiehellmanscreen> createState() => _DiffiehellmanscreenState();
}

class _DiffiehellmanscreenState extends State<Diffiehellmanscreen> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  final keyController = TextEditingController();

  final keyController2 = TextEditingController();

  final keyController3 = TextEditingController();

  final keyController4 = TextEditingController();

  String result = "";
  String cipherResult = "";
  BigInt? sharedKey;

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
          "Diffie Hellman Cipher",
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
                    "The Diffie-Hellman Key Exchange is a cryptographic algorithm used to securely share a secret key over an insecure communication channel without directly transmitting the key itself.\n\n"
                    "Purpose:\n"
                    "It allows two parties to generate a shared secret key that can be used for symmetric encryption.\n\n"
                    "Process:\n"
                    "1. Both parties agree on a public prime number (p) and a base (g).\n\n"
                    "2. Each party chooses a private key:\n"
                    "First chooses a private key (a)\n"
                    "Second chooses a private key (b)\n\n"
                    "3. Each party computes their public key:\n"
                    "A = g^a mod p\n"
                    "B = g^b mod p\n\n"
                    "4. They exchange public keys.\n\n"
                    "5. Each party computes the shared secret key:\n"
                    "Alice computes: S = B^a mod p\n"
                    "Bob computes: S = A^b mod p\n\n"
                    "Result:\n"
                    "Both parties obtain the same shared secret key S without ever transmitting it directly.\n\n"
                    "Security:\n"
                    "The security depends on the difficulty of solving the discrete logarithm problem.",
                    style: GoogleFonts.spaceMono(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: keyController,
                          style: GoogleFonts.spaceMono(color: Colors.white),
                          cursorColor: Appcolors.primaryColor,

                          decoration: InputDecoration(
                            labelText: "Prime Key",
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
                            if (!DiffieHellman.isPrime(BigInt.parse(value))) {
                              return "Key Must be prime";
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
                            labelText: "Generator Key",
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
                          controller: keyController4,
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
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  width: 340,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.primaryColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          BigInt p = BigInt.parse(keyController.text);

                          BigInt g = BigInt.parse(keyController2.text);

                          BigInt a = BigInt.parse(keyController3.text);

                          BigInt b = BigInt.parse(keyController4.text);

                          // Public Keys

                          BigInt A = DiffieHellman.generatePublicKey(p, g, a);

                          BigInt B = DiffieHellman.generatePublicKey(p, g, b);

                          // Shared Secret

                          BigInt secretAlice =
                              DiffieHellman.generateSharedSecret(B, a, p);

                          sharedKey = DiffieHellman.generateSharedSecret(
                            A,
                            b,
                            p,
                          );

                          result =
                              "First Public Key = $A\n"
                              "Second Public Key = $B\n"
                              "Shared Key = $secretAlice\n";
                        });
                      }
                      ;
                    },
                    child: Text(
                      "Generate Key",
                      style: GoogleFonts.spaceMono(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Appcolors.backgroundColor,
                    border: Border.all(
                      color: Appcolors.primaryColor,
                      width: 0.5,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Align(
                        alignment: AlignmentGeometry.topCenter,
                        child: Text(
                          result,
                          style: GoogleFonts.spaceMono(
                            color: Colors.white,

                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Appcolors.backgroundColor,
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Used Shared Key To Encrypt By Rail Fence Ciphers",
                        style: GoogleFonts.spaceMono(
                          color: Appcolors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
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
                SizedBox(height: 10),
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
                              int railKey = DiffieHellman.deriveRailKey(
                                sharedKey!,
                              );

                              cipherResult = encryptRailFence(
                                textController.text,
                                railKey,
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
                              int railKey = DiffieHellman.deriveRailKey(
                                sharedKey!,
                              );

                              cipherResult = decryptRailFence(
                                textController.text,
                                railKey,
                              );
                            });
                          }
                          ;
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
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Appcolors.backgroundColor,
                border: Border.all(color: Appcolors.primaryColor, width: 0.5),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: AlignmentGeometry.topCenter,
                    child: Text(
                      cipherResult,
                      style: GoogleFonts.spaceMono(
                        color: Colors.white,

                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
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
                    cipherResult = '';
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
      ),
    );
  }
}
