import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GeminiService {
  final String baseUrl = "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-pro:generateContent";
  final String? apiKeyOverride;

  // Optionally pass the API key to the constructor (useful when loaded from .env).
  GeminiService([this.apiKeyOverride]);

  Future<String> sendMessage(String message) async {
    final apiKey = apiKeyOverride ?? Platform.environment['GEMINI_API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      return "Missing GEMINI_API_KEY in environment or passed to GeminiService.";
    }

    final response = await http.post(
      Uri.parse("$baseUrl?key=$apiKey"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"][0]["content"]["parts"][0]["text"];
    } else {
      return "⚠️ Error: ${response.body}";
    }
  }
}
