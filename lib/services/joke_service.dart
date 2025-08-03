import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_jokes/const/enum/joke_category.dart';
import 'package:random_jokes/const/extensions/joke_extensioni.dart';
import 'package:random_jokes/model/joke_model.dart';

class JokeService {
  static const String _baseUrl = 'https://official-joke-api.appspot.com/';

  Future<List<JokeModel>> fetchMultipleJokes(
      {JokeCategory category = JokeCategory.programming}) async {
    final url = Uri.parse(_baseUrl + category.path);

    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => JokeModel.fromJson(json)).toList();
      } else {
        debugPrint('❌ HTTP ${response.statusCode}: ${response.body}');
        throw Exception('Failed to load jokes');
      }
    } catch (e, stacktrace) {
      debugPrint('Exception occurred: $e');
      debugPrint('📌 Stacktrace:\n$stacktrace');

      rethrow; // rethrow so UI can still handle it
    }
  }
}
