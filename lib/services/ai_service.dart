
import 'package:firebase_ai/firebase_ai.dart';

class AIService {
  final _model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

  Future<String> generateItinerary({
    required String destination,
    required String interests,
    required String days,
  }) async {
    try {
      final prompt = 'Create a travel itinerary for a trip to $destination for $days days. The traveler is interested in $interests. Provide a day-by-day plan. Format the output nicely.';
      final response = await _model.generateContent([Content.text(prompt)]);

      return response.text ?? 'Could not generate itinerary. Please try again.';
    } catch (e) {
      print('Error generating itinerary: $e');
      return 'An error occurred while generating the itinerary. Please check your connection and try again.';
    }
  }
}
