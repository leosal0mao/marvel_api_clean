import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String publicKey = dotenv.get('MARVEL_PUBLIC_KEY');
  static String privateKey = dotenv.get('MARVEL_PRIVATE_KEY');
  static String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  static String hash =
      md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString();
}
