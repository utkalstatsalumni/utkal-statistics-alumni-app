import 'package:hive/hive.dart';

class MemberService {
  static const String boxName = 'members';

  static Future<Box> _openBox() async {
    return await Hive.openBox(boxName);
  }

  static Future<void> addMember(Map<String, dynamic> member) async {
    final box = await _openBox();
    await box.add(member);
  }

  static Future<List<dynamic>> getMembers() async {
    final box = await _openBox();
    return box.values.toList();
  }

  static Future<void> deleteMember(int index) async {
    final box = await _openBox();
    await box.deleteAt(index);
  }

  static Future<void> updateMember(
    int index,
    Map<String, dynamic> member,
  ) async {
    final box = await _openBox();
    await box.putAt(index, member);
  }
}
