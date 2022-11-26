import 'dart:convert';

import 'package:flutter/services.dart';

class SecretModel {
  String apiKey;

  SecretModel({required this.apiKey});

  factory SecretModel.fromJson(Map<String, dynamic> json) {
    return SecretModel(apiKey: json["api_key"]);
  }
}

class SecretManager {
  Future<String> load() async {
    final keyJson = await rootBundle.loadString("secrets.json");
    final keys = jsonDecode(keyJson);
    SecretModel secret = SecretModel.fromJson(keys);
    return secret.apiKey;
  }
}
