import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'About',
      children: [
        _InfoCard(
          title: 'Our Association',
          body:
              'The Utkal Statistics Alumni Association connects alumni of the Post Graduate Department of Statistics, Utkal University, Vani Vihar, Bhubaneswar.',
        ),
        _InfoCard(
          title: 'Purpose',
          body:
              'The app will support alumni networking, verified member access, events, notices, memories, and academic contributions through the journal.',
        ),
      ],
    );
  }
}

class OfficeBearersPage extends StatelessWidget {
  const OfficeBearersPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bearers = [
      ('President', 'To be updated'),
      ('Secretary', 'To be updated'),
      ('Treasurer', 'To be updated'),
      ('Executive Member', 'To be updated'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Office Bearers')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final bearer = bearers[index];
          return ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(bearer.$1),
            subtitle: Text(bearer.$2),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemCount: bearers.length,
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Notifications',
      children: [
        _InfoCard(
          title: 'Welcome to the MVP',
          body:
              'Admin-created notices will appear here after Firebase is connected.',
        ),
        _InfoCard(
          title: 'Membership Verification',
          body:
              'New users must be verified by an admin before accessing full app features.',
        ),
      ],
    );
  }
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Events Calendar',
      children: [
        _InfoCard(
          title: 'Annual Alumni Meet',
          body:
              'Date and venue will be published here once finalized by the association.',
        ),
        _InfoCard(
          title: 'Webinar Series',
          body:
              'Future online talks, mentoring sessions, and departmental events can be listed here.',
        ),
      ],
    );
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  size: 44,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 8),
                Text('Album ${index + 1}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DirectoryPage extends StatelessWidget {
  const DirectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Alumni Directory',
      children: [
        _InfoCard(
          title: 'Verified Members Only',
          body:
              'The alumni directory will list approved members and allow search by batch, specialization, city, and profession.',
        ),
      ],
    );
  }
}

class HelpDeskPage extends StatelessWidget {
  const HelpDeskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Help Desk',
      children: [
        _InfoCard(
          title: 'Contact Association Admin',
          body:
              'Use this section later for membership support, profile corrections, event help, and journal submission queries.',
        ),
      ],
    );
  }
}

class _SimplePage extends StatelessWidget {
  const _SimplePage({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(padding: const EdgeInsets.all(16), children: children),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(body),
          ],
        ),
      ),
    );
  }
}
