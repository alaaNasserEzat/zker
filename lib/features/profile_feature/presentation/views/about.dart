import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String privacyPolicyUrl =
      'https://sites.google.com/view/zekr-privacy-policy';

  static const String email = 'your@email.com';

  Future<void> _openPrivacyPolicy() async {
    final uri = Uri.parse(privacyPolicyUrl);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _sendEmail(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;

    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': l10n.contactEmailSubject},
    );

    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: buildAppBar(context: context, title: l10n.about),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Logo
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 6),

            Text(
              l10n.zekrTagline,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 30),

            // Description
            _InfoCard(
              title: l10n.aboutZekr,
              child: Text(
                l10n.aboutDescription,
                style: theme.textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 12),

            // Features
            Card(
              child: Column(
                children: [
                  _FeatureTile(
                    icon: Icons.menu_book_rounded,
                    title: l10n.quran,
                    subtitle: l10n.quranDescription,
                  ),
                  _FeatureTile(
                    icon: Icons.favorite_rounded,
                    title: l10n.azkar,
                    subtitle: l10n.azkarDescription,
                  ),
                  _FeatureTile(
                    icon: Icons.fingerprint_rounded,
                    title: l10n.tasbeeh,
                    subtitle: l10n.tasbeehDescription,
                  ),
                  _FeatureTile(
                    icon: Icons.mosque_rounded,
                    title: l10n.prayerTimes,
                    subtitle: l10n.prayerTimesDescription,
                  ),
                  _FeatureTile(
                    icon: Icons.auto_awesome_rounded,
                    title: l10n.namesOfAllah,
                    subtitle: l10n.namesOfAllahDescription,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // App information
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.info_outline_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(l10n.version),
                    subtitle: const Text('1.0.0'),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(l10n.privacyPolicy),
                    trailing: Icon(
                      Icons.open_in_new_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onTap: _openPrivacyPolicy,
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(l10n.contactUs),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).iconTheme.color,
                      size: 16,
                    ),
                    onTap: () => _sendEmail(context),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Text(
              l10n.allahAcceptOurDeeds,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _InfoCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
