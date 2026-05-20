enum JournalStatus { pending, published, rejected }

class JournalEntry {
  const JournalEntry({
    required this.title,
    required this.author,
    required this.summary,
    required this.fileReference,
    required this.status,
    required this.submittedAt,
  });

  final String title;
  final String author;
  final String summary;
  final String fileReference;
  final JournalStatus status;
  final DateTime submittedAt;

  JournalEntry copyWith({JournalStatus? status}) {
    return JournalEntry(
      title: title,
      author: author,
      summary: summary,
      fileReference: fileReference,
      status: status ?? this.status,
      submittedAt: submittedAt,
    );
  }
}
