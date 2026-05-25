// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlumniUserAdapter extends TypeAdapter<AlumniUser> {
  @override
  final int typeId = 0;

  @override
  AlumniUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlumniUser(
      name: fields[0] as String,
      mobileNumber: fields[1] as String,
      email: fields[2] as String,
      passingYear: fields[3] as String,
      specialization: fields[4] as String,
      dateOfBirth: fields[5] as DateTime,
      currentJob: fields[6] as String,
      hobbies: (fields[7] as List).cast<String>(),
      photoReference: fields[8] as String,
      address: fields[9] as String,
      createdAt: fields[10] as DateTime,
      status: fields[11] as ApprovalStatus,
    );
  }

  @override
  void write(BinaryWriter writer, AlumniUser obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.mobileNumber)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.passingYear)
      ..writeByte(4)
      ..write(obj.specialization)
      ..writeByte(5)
      ..write(obj.dateOfBirth)
      ..writeByte(6)
      ..write(obj.currentJob)
      ..writeByte(7)
      ..write(obj.hobbies)
      ..writeByte(8)
      ..write(obj.photoReference)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlumniUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ApprovalStatusAdapter extends TypeAdapter<ApprovalStatus> {
  @override
  final int typeId = 1;

  @override
  ApprovalStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ApprovalStatus.pending;
      case 1:
        return ApprovalStatus.approved;
      case 2:
        return ApprovalStatus.rejected;
      default:
        return ApprovalStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ApprovalStatus obj) {
    switch (obj) {
      case ApprovalStatus.pending:
        writer.writeByte(0);
        break;
      case ApprovalStatus.approved:
        writer.writeByte(1);
        break;
      case ApprovalStatus.rejected:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApprovalStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
