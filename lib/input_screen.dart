import 'package:flutter/material.dart';
import 'package:myapp/itinerary_screen.dart';
import 'package:myapp/services/ai_service.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _destinationController = TextEditingController();
  final _interestsController = TextEditingController();
  final _daysController = TextEditingController();
  final _aiService = AIService();
  bool _isLoading = false;

  void _generateItinerary() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final itinerary = await _aiService.generateItinerary(
        destination: _destinationController.text,
        interests: _interestsController.text,
        days: _daysController.text,
      );

      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItineraryScreen(itinerary: itinerary),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Planner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _destinationController,
                decoration: const InputDecoration(
                  labelText: 'Destination',
                  hintText: 'e.g., Paris, France',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a destination.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _interestsController,
                decoration: const InputDecoration(
                  labelText: 'Interests',
                  hintText: 'e.g., museums, hiking, food',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your interests.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _daysController,
                decoration: const InputDecoration(
                  labelText: 'Number of Days',
                  hintText: 'e.g., 3',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of days.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _generateItinerary,
                      child: const Text('Generate Itinerary'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
