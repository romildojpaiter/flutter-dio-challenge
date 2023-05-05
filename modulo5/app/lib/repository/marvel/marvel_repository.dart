import 'dart:convert';

import 'package:app_modulo_05/model/characters_model.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarvelRepository {
  //

  Future<CharactersModel> getCharacters() async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.get("PUBLIC_KEY_MARVEL");
    var privateKey = dotenv.get("PRIVETE_KEY_MARVEL");
    var hash = generateMD5(ts + privateKey + publicKey);
    var query = "ts=$ts&apikey=$publicKey&hash=$hash";
    var result = await dio
        .get('https://gateway.marvel.com//v1/public/characters?$query');

    return CharactersModel.fromJson(result.data);
  }

  generateMD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
