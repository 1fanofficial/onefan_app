import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/config/supabase_initializer.dart';
import 'package:onefan_app/core/constants/app_theme.dart';
import 'package:onefan_app/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseInitializer.initialize();
  await AppPreferences().init();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "1FAN",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
