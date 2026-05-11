import 'dart:convert';
import 'package:crypto/crypto.dart';

class SHA256Hash {
  static String hash(String text) {
    final bytes = utf8.encode(text);

    final digest = sha256.convert(bytes);

    return digest.toString();
  }
}