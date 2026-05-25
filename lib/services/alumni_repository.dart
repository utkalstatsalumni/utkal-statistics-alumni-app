import 'package:flutter/foundation.dart';

import '../models/alumni_user.dart';
import '../models/journal_entry.dart';

class AlumniRepository {

  static final ValueNotifier<List<AlumniUser>> users =
      ValueNotifier<List<AlumniUser>>([
    AlumniUser(
      name: 'Admin User',
      mobileNumber: '9999999999',
      email: 'admin@usaa.com',
      passingYear: '2015',
      specialization: 'Applied Statistics',
      dateOfBirth: DateTime(1992, 6, 15),
      currentJob: 'Senior Data Analyst',
      hobbies: ['Reading', 'Travel', 'Research'],
      photoReference: '',
      address: 'Bhubaneswar, Odisha',
      createdAt: DateTime.now(),
      status: ApprovalStatus.approved,
    ),
  ]);

  static final ValueNotifier<List<JournalEntry>> journals =
      ValueNotifier<List<JournalEntry>>([]);

  static void registerUser(AlumniUser user) {

    users.value = [...users.value, user];
  }

  static AlumniUser? findUser(String mobileNumber) {

    try {

      return users.value.firstWhere(
        (user) => user.mobileNumber == mobileNumber,
      );

    } catch (e) {

      return null;
    }
  }

  static void updateUserStatus(
    String mobileNumber,
    ApprovalStatus status,
  ) {

    final updatedUsers = users.value.map((user) {

      if (user.mobileNumber == mobileNumber) {

        return user.copyWith(status: status);
      }

      return user;

    }).toList();

    users.value = updatedUsers;
  }

  static void submitJournal(JournalEntry entry) {

    journals.value = [...journals.value, entry];
  }

  static void updateJournalStatus(
    int index,
    JournalStatus status,
  ) {

    final updatedJournals = [...journals.value];

    updatedJournals[index] =
        updatedJournals[index].copyWith(
      status: status,
    );

    journals.value = updatedJournals;
  }
}
