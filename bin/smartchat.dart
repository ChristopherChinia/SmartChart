import 'dart:io';
import 'package:smartchat/services/gemini_service.dart';

/// Simple .env parser: reads key=value lines and returns a map.
Map<String, String> _loadDotEnv(File file) {
  final Map<String, String> map = {};
  for (final raw in file.readAsLinesSync()) {
    final line = raw.trim();
    if (line.isEmpty || line.startsWith('#')) continue;
    final idx = line.indexOf('=');
    if (idx <= 0) continue;
    final key = line.substring(0, idx).trim();
    var value = line.substring(idx + 1).trim();
    // Remove surrounding quotes if present
    if (value.length >= 2 && ((value.startsWith('"') && value.endsWith('"')) || (value.startsWith("'") && value.endsWith("'")))) {
      value = value.substring(1, value.length - 1);
    }
    map[key] = value;
  }
  return map;
}

void main() async {
  // Load OPENAI_API_KEY from a local `.env` file (project root) if present,
  // otherwise rely on system environment variables.
  String? keyFromEnvFile;
  final envFile = File('.env');
  if (envFile.existsSync()) {
    try {
  final parsed = _loadDotEnv(envFile);
      // Use GEMINI_API_KEY in the .env file to match the service in lib/services.
      keyFromEnvFile = parsed['GEMINI_API_KEY'];
    } catch (e) {
      // ignore parse errors and fall back to system env
    }
  }
  final ai = GeminiService(keyFromEnvFile);

  print("🤖 SmartChat AI Bot Activated!");
  print("Type 'exit' to end the chat.\n");

  while (true) {
    stdout.write("You: ");
    String? userInput = stdin.readLineSync();

    if (userInput == null || userInput.toLowerCase() == "exit") {
      print("🤖 Bot: Goodbye! 👋");
      break;
    }

    print("🤖 Bot is thinking...");
    String botResponse = await ai.sendMessage(userInput);
    print("🤖 Bot: $botResponse\n");
  }
}
