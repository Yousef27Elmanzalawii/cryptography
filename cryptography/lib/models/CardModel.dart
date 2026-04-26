import 'package:Cipherium/ciphers/Hill_cipher/HillScreen.dart';
import 'package:Cipherium/ciphers/Otp_Cipher/OtpScreen.dart';
import 'package:Cipherium/ciphers/affine_Cipher/affineScreen.dart';
import 'package:Cipherium/ciphers/caesar_Cipher/Ceaserscreen.dart';
import 'package:Cipherium/ciphers/viegener_Cipher/VigenereScreen.dart';
import 'package:flutter/material.dart';

class cardModel {
  final String image;
  final String title;
  final Widget page;

  cardModel({required this.image, required this.title, required this.page});
  static List<cardModel> Card = [
    cardModel(
      image: "assets/CrptoImg/1e8ebc9f3e4016dc8c6c409ab61422d3 (1).jpg",
      title: "Caesar Cipher",
      page: Ceaserscreen(),
    ),
    cardModel(
      image: 'assets/CrptoImg/aa27154f-0e1f-450f-ba30-f46b0c3ac40e.jpg',
      title: "Vigenère Cipher",
      page: Vigenerescreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/7ec59bbb14a456fa14c417ddaead5871.jpg",
      title: "Affine Cipher",
      page: Affinescreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/Хилл_Сандерс_Лестер.jpg",
      title: "Hill Cipher",
      page: Hillscreen(),
    ),
    cardModel(
      image: "assets/CrptoImg/ba49c927-9f71-4dc7-a338-63906e9991e9.jpeg",
      title: "OTP Cipher",
      page: Otpscreen(),
    ),
  ];
}
