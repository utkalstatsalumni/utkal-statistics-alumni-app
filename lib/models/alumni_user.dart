import 'package:hive/hive.dart';

part 'alumni_user.g.dart';

@HiveType(typeId: 1)
enum ApprovalStatus {

  @HiveField(0)
  pending,

  @HiveField(1)
  approved,

  @HiveField(2)
  rejected,
}

extension ApprovalStatusExtension on ApprovalStatus {

  String get statusLabel {

    switch (this) {

      case ApprovalStatus.pending:
        return 'Your account is pending approval';

      case ApprovalStatus.approved:
        return 'Approved';

      case ApprovalStatus.rejected:
        return 'Account rejected';
    }
  }
}

@HiveType(typeId: 0)
class AlumniUser {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String mobileNumber;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String passingYear;

  @HiveField(4)
  final String specialization;

  @HiveField(5)
  final DateTime dateOfBirth;

  @HiveField(6)
  final String currentJob;

  @HiveField(7)
  final List<String> hobbies;

  @HiveField(8)
  final String photoReference;

  @HiveField(9)
  final String address;

  @HiveField(10)
  final DateTime createdAt;

  @HiveField(11)
  final ApprovalStatus status;

  AlumniUser({
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.passingYear,
    required this.specialization,
    required this.dateOfBirth,
    required this.currentJob,
    required this.hobbies,
    required this.photoReference,
    required this.address,
    required this.createdAt,
    this.status = ApprovalStatus.pending,
  });

  AlumniUser copyWith({
    String? name,
    String? mobileNumber,
    String? email,
    String? passingYear,
    String? specialization,
    DateTime? dateOfBirth,
    String? currentJob,
    List<String>? hobbies,
    String? photoReference,
    String? address,
    DateTime? createdAt,
    ApprovalStatus? status,
  }) {

    return AlumniUser(
      name: name ?? this.name,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      passingYear: passingYear ?? this.passingYear,
      specialization: specialization ?? this.specialization,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      currentJob: currentJob ?? this.currentJob,
      hobbies: hobbies ?? this.hobbies,
      photoReference: photoReference ?? this.photoReference,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  String get statusLabel => status.statusLabel;
}
