import 'package:flutter/foundation.dart';

import '../models/alumni_user.dart';
import '../models/journal_entry.dart';

class AlumniRepository {
  AlumniRepository._();

  static final ValueNotifier<List<AlumniUser>> users =
      ValueNotifier<List<AlumniUser>>([
        AlumniUser(
          name: 'Sample Pending Alumni',
          dateOfBirth: DateTime(1992, 6, 15),
          passingYear: 2015,
          currentJob: 'Data Analyst, Bhubaneswar',
          specialization: 'Applied Statistics',
          hobbies: const ['Mentoring', 'Research', 'Events'],
          photoReference: '',
          address: 'Bhubaneswar, Odisha',
          mobileNumber: '9999999999',
          email: 'sample.alumni@example.com',
          status: ApprovalStatus.pending,
          createdAt: DateTime.now(),
        ),
      ]);

  static final ValueNotifier<List<JournalEntry>>
  journals = ValueNotifier<List<JournalEntry>>([
    JournalEntry(
      title: 'Remembering the Department Seminar Series',
      author: 'Editorial Team',
      summary:
          'A short note celebrating academic talks and student participation.',
      fileReference: 'sample-journal.pdf',
      status: JournalStatus.published,
      submittedAt: DateTime.now(),
    ),
  ]);

  static AlumniUser? findApprovedUser(String mobileNumber) {
    for (final user in users.value) {
      if (user.mobileNumber == mobileNumber &&
          user.status == ApprovalStatus.approved) {
        return user;
      }
    }

    return null;
  }

  static AlumniUser? findUser(String mobileNumber) {
    for (final user in users.value) {
      if (user.mobileNumber == mobileNumber) {
        return user;
      }
    }

    return null;
  }

  static void registerUser(AlumniUser user) {
    users.value = [
      ...users.value.where((item) => item.mobileNumber != user.mobileNumber),
      user,
    ];
  }

  static void updateUserStatus(String mobileNumber, ApprovalStatus status) {
    users.value = [
      for (final user in users.value)
        if (user.mobileNumber == mobileNumber)
          user.copyWith(status: status)
        else
          user,
    ];
  }

  static void submitJournal(JournalEntry entry) {
    journals.value = [entry, ...journals.value];
  }

  static void updateJournalStatus(String title, JournalStatus status) {
    journals.value = [
      for (final entry in journals.value)
        if (entry.title == title) entry.copyWith(status: status) else entry,
    ];
  }
}
