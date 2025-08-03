import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_jokes/model/joke_model.dart';

class JokeService {
  // Future<JokeModel> fetchJokes() async {
  //   final url = Uri.parse('https://official-joke-api.appspot.com/random_ten');

  //   try {
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //     return data.map((json) => JokeModel.fromJson(json)).toList();
  // } else {
  //   debugPrint('❌ HTTP ${response.statusCode}: ${response.body}');
  //   throw Exception('Failed to load jokes');
  // }
  // } catch (e, stacktrace) {
  //   debugPrint('🔥 Exception occurred: $e');
  //   debugPrint('📌 Stacktrace:\n$stacktrace');

  //   rethrow; // rethrow so UI can still handle it
  // }
  // }

  Future<List<JokeModel>> fetchMultipleJokes() async {
    final url = Uri.parse('https://official-joke-api.appspot.com/random_ten');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => JokeModel.fromJson(json)).toList();
      } else {
        debugPrint('❌ HTTP ${response.statusCode}: ${response.body}');
        throw Exception('Failed to load jokes');
      }
    } catch (e, stacktrace) {
      debugPrint('🔥 Exception occurred: $e');
      debugPrint('📌 Stacktrace:\n$stacktrace');

      rethrow; // rethrow so UI can still handle it
    }
  }
}
