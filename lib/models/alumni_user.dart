enum ApprovalStatus { pending, approved, rejected }

class AlumniUser {
  const AlumniUser({
    required this.name,
    required this.dateOfBirth,
    required this.passingYear,
    required this.currentJob,
    required this.specialization,
    required this.hobbies,
    required this.photoReference,
    required this.address,
    required this.mobileNumber,
    required this.email,
    required this.status,
    required this.createdAt,
  });

  final String name;
  final DateTime dateOfBirth;
  final int passingYear;
  final String currentJob;
  final String specialization;
  final List<String> hobbies;
  final String photoReference;
  final String address;
  final String mobileNumber;
  final String email;
  final ApprovalStatus status;
  final DateTime createdAt;

  AlumniUser copyWith({ApprovalStatus? status}) {
    return AlumniUser(
      name: name,
      dateOfBirth: dateOfBirth,
      passingYear: passingYear,
      currentJob: currentJob,
      specialization: specialization,
      hobbies: hobbies,
      photoReference: photoReference,
      address: address,
      mobileNumber: mobileNumber,
      email: email,
      status: status ?? this.status,
      createdAt: createdAt,
    );
  }

  String get statusLabel {
    return switch (status) {
      ApprovalStatus.pending => 'Pending approval',
      ApprovalStatus.approved => 'Approved',
      ApprovalStatus.rejected => 'Rejected',
    };
  }
}
