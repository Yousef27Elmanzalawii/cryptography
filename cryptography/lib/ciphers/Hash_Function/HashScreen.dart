import 'package:Cipherium/ciphers/Hash_Function/Hashcipher.dart';
import 'package:Cipherium/models/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hashscreen extends StatefulWidget {
  const Hashscreen({super.key});

  @override
  State<Hashscreen> createState() => _HashscreenState();
}

class _HashscreenState extends State<Hashscreen> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

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
          "Hash Cipher",
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
                    "The SHA-256 Hash Algorithm is a secure cryptographic hash function that converts any input data into a fixed 256-bit (64 hexadecimal characters) hash value.\n\n"
                    "SHA-256 belongs to the SHA-2 family designed by the National Security Agency (NSA) and is widely used in cybersecurity, blockchain, and password protection.\n\n"
                    "Unlike encryption, SHA-256 is a one-way function, meaning the original message cannot be recovered from the hash.\n\n"
                    "Purpose:\n"
                    "It is used for password storage, digital signatures, blockchain systems, certificates, and verifying file integrity.\n\n"
                    "Process:\n"
                    "1. The input message is converted into binary.\n"
                    "2. The message is padded to fit 512-bit blocks.\n"
                    "3. SHA-256 performs multiple rounds of bitwise operations and compression.\n"
                    "4. A unique 256-bit hash value is generated.\n\n"
                    "Hash Equation (conceptual):\n"
                    "H = SHA256(message)\n\n"
                    "Example:\n"
                    "Input: HELLO\n"
                    "Output:\n"
                    "3733cd977ff8eb18b987357e22ced99f46097f31ecb239e878ae63760e83e4d5\n\n"
                    "Properties:\n"
                    "- Deterministic: same input always gives the same hash\n"
                    "- One-way: original data cannot be recovered\n"
                    "- Fixed output length: always 256 bits\n"
                    "- Avalanche effect: tiny input changes create huge output differences\n"
                    "- Collision resistant: extremely difficult for two inputs to produce the same hash\n\n"
                    "Security:\n"
                    "SHA-256 is considered highly secure and is commonly used in Bitcoin, SSL certificates, and modern authentication systems.",
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
                ],
              ),
            ),
            SizedBox(height: 20),
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
                          result = SHA256Hash.hash(textController.text);
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
                        fontSize: 15,
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
