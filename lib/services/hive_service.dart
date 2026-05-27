import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  static Box getBox(String boxName) {
    return Hive.box(boxName);
  }
}
