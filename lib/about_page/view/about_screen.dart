import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: const Text(
          "About",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blueGrey[200],
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Help",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Text(
              "Find answers to your book review question here",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 29,
            ),
            Text(
              "Send book review",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Text(
              "Help us make Book Review better",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 29,
            ),
            Text(
              "Open source licenses",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Text(
              "Licenses details for open source software",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 29,
            ),
            Text(
              "App version",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Text(
              "3.13.4",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}
