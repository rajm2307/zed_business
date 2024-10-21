import 'dart:convert';
import 'package:crypto/crypto.dart';

String generateMd5(String data) {
  var bytes = utf8.encode(data); // Convert data to UTF-8 bytes
  var digest = md5.convert(bytes); // Compute the MD5 hash
  return digest.toString(); // Convert the hash to a hexadecimal string
}
