import 'package:flutter/material.dart';

import '../models/alumni_user.dart';
import '../models/journal_entry.dart';
import '../services/alumni_repository.dart';
import 'login_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Dashboard'),
          actions: [
            IconButton(
              tooltip: 'Logout',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Alumni'),
              Tab(text: 'Journal'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_PendingUsersTab(), _JournalReviewTab()],
        ),
      ),
    );
  }
}

class _PendingUsersTab extends StatelessWidget {
  const _PendingUsersTab();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<AlumniUser>>(
      valueListenable: AlumniRepository.users,
      builder: (context, users, _) {
        final pendingUsers = users
            .where((user) => user.status == ApprovalStatus.pending)
            .toList();

        if (pendingUsers.isEmpty) {
          return const _EmptyState(message: 'No pending alumni profiles.');
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final user = pendingUsers[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text('Mobile: ${user.mobileNumber}'),
                    Text('Email: ${user.email}'),
                    Text('Passing year: ${user.passingYear}'),
                    Text('Current job: ${user.currentJob}'),
                    Text('Specialization: ${user.specialization}'),
                    Text('Interests: ${user.hobbies.join(', ')}'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              AlumniRepository.updateUserStatus(
                                user.mobileNumber,
                                ApprovalStatus.approved,
                              );
                            },
                            icon: const Icon(Icons.check),
                            label: const Text('Approve'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              AlumniRepository.updateUserStatus(
                                user.mobileNumber,
                                ApprovalStatus.rejected,
                              );
                            },
                            icon: const Icon(Icons.close),
                            label: const Text('Reject'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemCount: pendingUsers.length,
        );
      },
    );
  }
}

class _JournalReviewTab extends StatelessWidget {
  const _JournalReviewTab();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<JournalEntry>>(
      valueListenable: AlumniRepository.journals,
      builder: (context, journals, _) {
        final pendingJournals = journals
            .where((entry) => entry.status == JournalStatus.pending)
            .toList();

        if (pendingJournals.isEmpty) {
          return const _EmptyState(message: 'No pending journal submissions.');
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final entry = pendingJournals[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text('Author: ${entry.author}'),
                    Text(entry.summary),
                    Text('File: ${entry.fileReference}'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              AlumniRepository.updateJournalStatus(
                                index,
                                JournalStatus.published,
                              );
                            },
                            icon: const Icon(Icons.publish),
                            label: const Text('Publish'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              AlumniRepository.updateJournalStatus(
                                index,
                                JournalStatus.rejected,
                              );
                            },
                            icon: const Icon(Icons.block),
                            label: const Text('Reject'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemCount: pendingJournals.length,
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
