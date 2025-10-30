# SmartChat – Beginner AI Chatbot in Dart

## 1. Title & Objective

SmartChat is a beginner-friendly AI chatbot built using **Dart** programming language and the **Gemini API**. The objective of this project is to help learners understand how to build a simple but functional AI chatbot while learning how to work with APIs, environment variables, and Dart programming basics. This toolkit documents the full journey from setup to completion so that anyone can follow and build their own AI chatbot.


## 3. System Requirements

To build and run the SmartChat AI project using Dart, the following tools and resources are required:

| Requirement           | Description                             |
| --------------------- | --------------------------------------- |
| Operating System      | Windows, macOS, or Linux                |
| Programming Language  | Dart SDK (version 3.x or later)         |
| Code Editor           | Visual Studio Code or any text editor   |
| Terminal/Command Line | PowerShell, Command Prompt, or Terminal |
| Internet Connection   | Required for API responses              |
| OpenAI Account        | For generating API key                  |
| Dependencies          | `http` package, `dotenv` package        |



## 4. Installation & Setup Instructions

### Step 1: Install Dart SDK

1. Visit the official Dart SDK download page: [https://dart.dev/get-dart](https://dart.dev/get-dart)
2. Select **Windows** and download the Dart SDK installer.
3. During installation, check **"Add Dart to PATH"**.
4. After installation, verify Dart by running this command in your terminal:

   ```bash
   dart --version
   ```

### Step 2: Create Project Folder

Open your terminal and run the following commands:

```bash
mkdir smartchat
cd smartchat
dart create -t smartchart .
```

### Step 3: Open the Project in VS Code

```bash
code .
```

This opens the project folder inside Visual Studio Code.

### Step 4: Add Dependencies

Open the `pubspec.yaml` file and under **dependencies**, add:

```yaml
dependencies:
  http: ^1.1.0
  dotenv: ^4.2.0
```

Then install dependencies using:

```bash
dart pub get
```

### Step 5: Create Environment File

Create a file named `.env` in the project root folder and add:

```
Gemini_API_KEY=your_Geminiai_api_key_here
```

⚠️ Do NOT share your API key publicly.

### Step 6: Create Service File

Create a folder called `services` inside `lib` and create a file named `openai_service.dart` inside it.

### Step 7: Run the Project

Test the default Dart console program:

```bash
dart run
```

If it prints **Hello, 42**, setup is successful.


### Step 8: AI-Powered Chatbot

This version uses the Gemini API to generate intelligent responses.

```dart
import 'dart:io';
import 'package:dotenv/dotenv.dart' show load;
import '../lib/services/Gemini_service.dart';

void main() async {
  load();
  final openAI = OpenAIService();
  print("SmartChat AI Mode");

  while (true) {
    stdout.write("You: ");
    String? userInput = stdin.readLineSync();
    if (userInput == null || userInput.toLowerCase() == "exit") break;
    String reply = await openAI.sendMessage(userInput);
    print("Bot: $reply");
  }
}
```

Expected Output Example:

```
You: What is an API?
Bot: An API (Application Programming Interface) allows software systems to communicate.
```


## 5. Common Issues & Fixes

During the development of SmartChat, several common issues were encountered. Below are the problems and how they were solved.

###  Issue 1: `dart` command not recognized

**Cause:** Dart SDK not added to PATH.
**Fix:** Reinstall Dart and ensure **"Add to PATH"** is checked during installation.

###  Issue 2: Dependencies not found

**Error Message:** `Because smartchat depends on http... version solving failed`
**Fix:** Run:

```bash
dart pub get
```

Ensure `pubspec.yaml` indentation is correct.

###  Issue 3: `.env` file not loading

**Cause:** dotenv package not initialized.
**Fix:** Add this at the start of `main()`:

```dart
load();
```

###  Issue 4: API key showing "Unauthorized"

**Cause:** Incorrect or missing API key.
**Fix:** Check `.env` file contains:

```
Gemini_API_KEY=your_key_here
```

Restart terminal after saving.

###  Issue 5: `Unhandled exception: type 'Null' is not a subtype of type 'String'`

**Cause:** Empty user input.
**Fix:** Add null check for user messages.

###  Issue 6: Bot stops responding after a few messages

**Cause:** Missing async/await during API request.
**Fix:** Ensure function is:

```dart
String reply = await Gemini.sendMessage(userInput);
```

###  Issue 7: HTTP 429 – Too Many Requests

**Cause:** API usage limit reached.
**Fix:** Wait or upgrade OpenAI billing plan.

###  Issue 8: API timeout or no internet

**Cause:** Network issue.
**Fix:** Add error message in code for failed API request.

## 6. How to solve errors with AI Prompts
During the development of SmartChat, Issued some AI Prompt to solve some of the problems here are some example:
```
I'm a junior developer who just started learning dart programming language. I need help understanding the project structure and technology stack.

I'd like to understand:
- The difference between dart from other programming language interm of syntax.
- The folder structure seems to follow [pattern you've observed]

Project structure:
[Paste concise directory structure - limit to top-level folders and key subfolders]

Key configuration files:
[Paste relevant sections from package.json/pom.xml/requirements.txt/Gemfile, docker files, etc.]

Could you:
1. Validate my understanding and correct any misconceptions
2. Identify additional key technologies, frameworks, and libraries used
3. Explain what each main folder likely contains and its purpose
4. Point out where the application entry points are located
5. Suggest 3-5 specific questions I should ask my team to deepen my understanding

I'm particularly confused about [mention specific areas of confusion, if any].

After your explanation, could you suggest a small exploration exercise I could do to verify my understanding of the project structure?
```
```bash

```

## 7. References

Below are the main resources used during research and development of the SmartChat project:

1. Dart Official Documentation – [https://dart.dev](https://dart.dev)
2. Dart SDK Installation Guide – [https://dart.dev/get-dart](https://dart.dev/get-dart)
3. Dart Packages (`pub.dev`) – [https://pub.dev](https://pub.dev)
4. HTTP Package for API requests – [https://pub.dev/packages/http](https://pub.dev/packages/http)
5. Dotenv Package for environment variables – [https://pub.dev/packages/dotenv](https://pub.dev/packages/dotenv)
6. OpenAI API Documentation – [https://platform.openai.com/docs](https://platform.openai.com/docs)
7. REST API Basics – [https://www.freecodecamp.org/news/what-is-an-api/](https://www.freecodecamp.org/news/what-is-an-api/)
8. VS Code IDE – [https://code.visualstudio.com](https://code.visualstudio.com)
9. Command Line Basics – [https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line)
10. JSON Introduction – [https://www.json.org](https://www.json.org)
11. Asynchronous Programming Concepts – [https://dart.dev/codelabs/async-await](https://dart.dev/codelabs/async-await)
12. TutorialsPoint Dart Basics – [https://www.tutorialspoint.com/dart_programming](https://www.tutorialspoint.com/dart_programming)

