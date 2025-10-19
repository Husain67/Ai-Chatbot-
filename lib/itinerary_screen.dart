
import 'package:flutter/material.dart';

class ItineraryScreen extends StatelessWidget {
  final String itinerary;

  const ItineraryScreen({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Itinerary'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(itinerary),
      ),
    );
  }
}
