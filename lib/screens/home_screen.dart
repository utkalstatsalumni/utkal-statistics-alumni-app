import 'package:flutter/material.dart';

import '../models/alumni_user.dart';
import 'feature_pages.dart';
import 'journal_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.user, super.key});

  final AlumniUser user;

  @override
  Widget build(BuildContext context) {
    final featureTiles = [
      _FeatureTile(title: 'About', icon: Icons.info, page: const AboutPage()),
      _FeatureTile(
        title: 'Office Bearers',
        icon: Icons.groups,
        page: const OfficeBearersPage(),
      ),
      _FeatureTile(
        title: 'Notifications',
        icon: Icons.notifications,
        page: const NotificationsPage(),
      ),
      _FeatureTile(
        title: 'Events Calendar',
        icon: Icons.event,
        page: const EventsPage(),
      ),
      _FeatureTile(
        title: 'Gallery',
        icon: Icons.photo_library,
        page: const GalleryPage(),
      ),
      _FeatureTile(
        title: 'Journal',
        icon: Icons.menu_book,
        page: JournalScreen(user: user),
      ),
      _FeatureTile(
        title: 'Directory',
        icon: Icons.badge,
        page: const DirectoryPage(),
      ),
      _FeatureTile(
        title: 'Help Desk',
        icon: Icons.help,
        page: const HelpDeskPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('USAA Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png', height: 72, width: 72),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ${user.name}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${user.passingYear} batch • ${user.specialization}',
                        ),
                        Text(user.currentJob),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: featureTiles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) => featureTiles[index],
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.title,
    required this.icon,
    required this.page,
  });

  final String title;
  final IconData icon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
