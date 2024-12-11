
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MoodPredictorApp());
}

class MoodPredictorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoodPredictor(),
    );
  }
}

class MoodPredictor extends StatefulWidget {
  @override
  _MoodPredictorState createState() => _MoodPredictorState();
}

class _MoodPredictorState extends State<MoodPredictor> {
  String _prediction = "اینجا منتظر پیش‌بینی شما هستیم!";

  final List<String> _moods = [
    "امروز شما خوشحال خواهید بود 🎉",
    "امروز ممکن است کمی فکر کنید 🤔",
    "یک ماجراجویی در پیش دارید 🚀",
    "روز آرام و دلنشینی خواهید داشت 🌸",
    "شاید کمی چالش پیش رویتان باشد، اما موفق خواهید شد! 💪",
    "امروز روز خنده و شوخی است 😄"
  ];

  void _predictMood() {
    final random = Random();
    setState(() {
      _prediction = _moods[random.nextInt(_moods.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("پیش‌بینی حالت روحی"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "حالت امروز خود را پیش‌بینی کنید!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              _prediction,
              style: TextStyle(fontSize: 18, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _predictMood,
              child: Text("پیش‌بینی کن"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
