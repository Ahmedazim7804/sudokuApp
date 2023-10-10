import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Theme.of(context).colorScheme.primaryContainer.withAlpha(120));

    Future<void> takeToMyGithub() async {
      final Uri url = Uri.parse('https://github.com/ahmedazim7804');
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Info Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondary,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Name: Ajeem Ahmad",
                  style: textStyle,
                ),
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.secondary,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Roll No: 2023UIT3033",
                  style: textStyle,
                ),
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.secondary,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Branch: IT",
                  style: textStyle,
                ),
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.secondary,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Section: 1",
                  style: textStyle,
                ),
              ),
            ),
            GestureDetector(
              onTap: takeToMyGithub,
              child: const Image(
                image: AssetImage('assets/github.png'),
                width: 128,
                height: 128,
              ),
            )
          ],
        ),
      ),
    );
  }
}
