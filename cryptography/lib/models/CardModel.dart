import 'package:Cipherium/ciphers/Columnar_Cipher/ColumnarScreen.dart';
import 'package:Cipherium/ciphers/Hill_cipher/HillScreen.dart';
import 'package:Cipherium/ciphers/Otp_Cipher/OtpScreen.dart';
import 'package:Cipherium/ciphers/RSA_Cipher/RSAscreen.dart';
import 'package:Cipherium/ciphers/RailFence_Cipher/RailFenceScreen.dart';
import 'package:Cipherium/ciphers/affine_Cipher/affineScreen.dart';
import 'package:Cipherium/ciphers/caesar_Cipher/Ceaserscreen.dart';
import 'package:Cipherium/ciphers/substitution_Cipher/substituitionScreen.dart';
import 'package:Cipherium/ciphers/viegener_Cipher/VigenereScreen.dart';
import 'package:flutter/material.dart';

class cardModel {
  final String image;
  final String title;
  final Widget page;

  cardModel({required this.image, required this.title, required this.page});
  static List<cardModel> Card = [
    cardModel(
      image: "assets/CrptoImg/CeaserCipher.jpg",
      title: "Caesar Cipher",
      page: Ceaserscreen(),
    ),
    cardModel(
      image: 'assets/CrptoImg/substitution-cipher.webp',
      title: "Substitution Cipher",
      page: Substitutionscreen(),
    ),
    cardModel(
      image: 'assets/CrptoImg/VigenereCipher.jpg',
      title: "Vigenère Cipher",
      page: Vigenerescreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/AffineCipher.jpg",
      title: "Affine Cipher",
      page: Affinescreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/HillCipher.jpg",
      title: "Hill Cipher",
      page: Hillscreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/OTPEdited.jpeg",
      title: "OTP Cipher",
      page: Otpscreen(),
    ),
    cardModel(
      image: 'assets/CrptoImg/RailFence.png',
      title: "Rail Fence Cipher",
      page: Railfencescreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/columnartransapostiton.png",
      title: "Columnar Transposition",
      page: Columnarscreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/RSA.png",
      title: "RSA Cipher",
      page: Rsascreen(),
    ),
  ];
}
