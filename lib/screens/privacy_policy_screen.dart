import 'package:flutter/material.dart';
import 'package:myapp/l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(title: Text(localizations.privacyPolicy)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.privacyPolicy,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              localizations.lastUpdated,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildSection(
              localizations.informationCollected,
              localizations.infoCollectedDetails,
            ),
            _buildSection(
              localizations.howWeUseInfo,
              localizations.useInfoDetails,
            ),
            _buildSection(
              localizations.dataStorageSecurity,
              localizations.storageDetails,
            ),
            _buildSection(
              localizations.thirdPartyServices,
              localizations.thirdPartyDetails,
            ),
            _buildSection(
              localizations.yourRights,
              localizations.rightsDetails,
            ),
            _buildSection(
              localizations.contactUs,
              localizations.contactDetails,
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
