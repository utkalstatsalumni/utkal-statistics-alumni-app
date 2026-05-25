import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/alumni_user.dart';
import 'screens/splash_screen.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(AlumniUserAdapter());
  }

  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ApprovalStatusAdapter());
  }

  await Hive.openBox<AlumniUser>('alumni_users');

  runApp(const AlumniApp());
}

class AlumniApp extends StatelessWidget {
  const AlumniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Utkal Statistics Alumni Association',

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}