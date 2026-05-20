import 'package:flutter/material.dart';

import '../models/alumni_user.dart';
import '../models/journal_entry.dart';
import '../services/alumni_repository.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({required this.user, super.key});

  final AlumniUser user;

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final summaryController = TextEditingController();
  final fileReferenceController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    fileReferenceController.dispose();
    super.dispose();
  }

  void _submitJournal() {
    if (!_formKey.currentState!.validate()) return;

    AlumniRepository.submitJournal(
      JournalEntry(
        title: titleController.text.trim(),
        author: widget.user.name,
        summary: summaryController.text.trim(),
        fileReference: fileReferenceController.text.trim(),
        status: JournalStatus.pending,
        submittedAt: DateTime.now(),
      ),
    );

    titleController.clear();
    summaryController.clear();
    fileReferenceController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Journal submitted for admin review.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Journal')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ValueListenableBuilder<List<JournalEntry>>(
            valueListenable: AlumniRepository.journals,
            builder: (context, journals, _) {
              final published = journals
                  .where((entry) => entry.status == JournalStatus.published)
                  .toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Published Articles',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  if (published.isEmpty)
                    const Text('No published journal articles yet.')
                  else
                    for (final entry in published)
                      Card(
                        child: ListTile(
                          title: Text(entry.title),
                          subtitle: Text('${entry.author}\n${entry.summary}'),
                          isThreeLine: true,
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Submit an Article',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Article Title',
                    prefixIcon: Icon(Icons.title),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter article title';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: summaryController,
                  minLines: 3,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Summary',
                    prefixIcon: Icon(Icons.notes),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter article summary';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: fileReferenceController,
                  decoration: const InputDecoration(
                    labelText: 'File Reference',
                    helperText: 'For now, enter PDF file name or link.',
                    prefixIcon: Icon(Icons.attach_file),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter a file reference';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _submitJournal,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Submit for Review'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
