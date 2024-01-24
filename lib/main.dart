import 'package:flutter/material.dart';
import 'package:flutter_template/provider/app_provider.dart';
import 'package:flutter_template/routes/app_router.dart';
import 'package:flutter_template/utils/app_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  /// 这行代码的作用是确保 Flutter 的 widget 绑定已经初始化
  WidgetsFlutterBinding.ensureInitialized();

  await AppInfo().init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 获取router
    final appRouter = AppRouter();

    final app = ref.watch(appProvider);

    return MaterialApp.router(
      routerConfig: appRouter.router,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      themeMode: app.firstWhere((v) => v.name == 'theme').enable ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
