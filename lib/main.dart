import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lyrical/Core/Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyrical',
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const LyricsPage(),
    );
  }
}

class LyricsPage extends StatefulWidget {
  const LyricsPage({super.key});

  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _lyricsController = TextEditingController();

  // Boolean to track loading state
  bool _isLoading = false;


  Future<void> generateLyrics() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    try {
      final response = await http.post(
        Uri.parse(
            'https://lyrical-backend-git-main-gourav2982s-projects.vercel.app/generate_lyrics'),
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
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
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
              TextField(
                controller: _languageController,
                decoration: const InputDecoration(
                  labelText: 'Language',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _genreController,
                decoration: const InputDecoration(
                  labelText: 'Genre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Describe the song',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

           
              ElevatedButton(
                onPressed: generateLyrics,
                child: const Text('Create/Update Lyrics'),
              ),
              const SizedBox(height: 16),

             
              _isLoading
                  ? const CircularProgressIndicator() // Show loading indicator
                  : TextField(
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
      Generate Song Lyrics with these features:
      Language: $lang
      Genre: $genere
      Description: $desc

      Give the response in plain text without any illegal character, write it in the original language characters and in English interpretation in the same line.
      Respond in this format:
      ज़िन्दगी एक सफ़र है, (Life is a journey).
      At least 10 lines, but make it long to make it better.
''';
  }
}
