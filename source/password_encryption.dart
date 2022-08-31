import 'package:flutter/services.dart' show rootBundle;

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<String> getEncryptedData(String plainText) async {
  final publicPem = await rootBundle.loadString('assets/public.pem');

  final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;

  final encrypt = Encrypter(RSA(
    publicKey: publicKey,
  ));

  final encrypted = encrypt.encrypt(plainText);

  logger.d(encrypted.base64);

  return encrypted.base64;
}
