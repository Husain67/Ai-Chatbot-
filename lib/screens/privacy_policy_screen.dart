import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Last updated: January 2025',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Information We Collect',
              '• Text messages you send to the chatbot\n'
                  '• Images you upload for analysis\n'
                  '• Voice recordings (if voice input is used)\n'
                  '• App usage analytics',
            ),
            _buildSection(
              'How We Use Your Information',
              '• To provide AI-powered responses to your queries\n'
                  '• To analyze images you upload\n'
                  '• To improve our AI models and services\n'
                  '• To provide customer support',
            ),
            _buildSection(
              'Data Storage and Security',
              '• Your conversations are processed in real-time\n'
                  '• Images are temporarily stored for analysis only\n'
                  '• We use industry-standard encryption\n'
                  '• Data is not stored permanently on our servers',
            ),
            _buildSection(
              'Third-Party Services',
              '• Google Gemini AI for text and image processing\n'
                  '• Firebase for app functionality\n'
                  '• These services have their own privacy policies',
            ),
            _buildSection(
              'Your Rights',
              '• You can delete your conversation history\n'
                  '• You can opt out of analytics\n'
                  '• You can request data deletion\n'
                  '• Contact us for any privacy concerns',
            ),
            _buildSection(
              'Contact Us',
              'If you have any questions about this Privacy Policy, please contact us at:\n\n'
                  'Email: privacy@flutterchatbot.com\n'
                  'Address: [Your Address Here]',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 24),
      ],
    );
  }
}
