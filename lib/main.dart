import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lyrical/Core/Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyrical',
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: LyricsPage(),
    );
  }
}

class LyricsPage extends StatefulWidget {
  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _lyricsController = TextEditingController();

  // Function to send request to backend and fetch generated lyrics
  Future<void> generateLyrics() async {
    debugPrint("description: ${jsonEncode(<String, String>{
          'description': buildPrompt(
            _languageController.text.trim(),
            _genreController.text.trim(),
            _descriptionController.text.trim(),
          ),
        })}");
    // Replace with your backend URL
    final response = await http.post(
      Uri.parse('https://lyrical-backend-git-main-gourav2982s-projects.vercel.app/generate_lyrics'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'description': buildPrompt(
          _languageController.text.trim(),
          _genreController.text.trim(),
          _descriptionController.text.trim(),
        ),
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        final responseBody = utf8.decode(response.bodyBytes);
        _lyricsController.text = jsonDecode(responseBody)['lyrics'];
      });
    } else {
      throw Exception('Failed to generate lyrics');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Personal AI Lyricist'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Language input
              TextField(
                controller: _languageController,
                decoration: const InputDecoration(
                  labelText: 'Language',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Genre input
              TextField(
                controller: _genreController,
                decoration: const InputDecoration(
                  labelText: 'Genre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Song description input
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Describe the song',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Button to generate/update lyrics
              ElevatedButton(
                onPressed: generateLyrics,
                child: const Text('Create/Update Lyrics'),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _lyricsController,
                maxLines: 8,
                decoration: const InputDecoration(
                  labelText: 'Generated Lyrics',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String buildPrompt(String lang, String genere, String desc) {
    return '''
      Generate Song Lyrics with these feature:
      Language:$lang
      Genere:$genere
      Description:$desc

      Give the respone in plain text without any illegal character write it in original language charcters and  in english interpertation in same line
      Respond in this format (format only)
      ज़िन्दगी एक सफ़र है,        (Life is a journey).
      At least 10 lines, but make it long to make it better
''';
  }
}
