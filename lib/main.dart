import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/app_controller.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final controller = AppController();

  await controller.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (_) => controller,
      child: const LegalTrackApp(),
    ),
  );
}

class LegalTrackApp extends StatelessWidget {
  const LegalTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LegalTrack',
      home: Consumer<AppController>(
        builder: (context, controller, child) {
          return controller.isLoggedIn ? const HomePage() : const LoginPage();
        },
      ),
    );
  }
}
