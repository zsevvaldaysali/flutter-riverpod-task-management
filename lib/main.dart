import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/features/todo/pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.orange,
  );
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.pink,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'zsevvaldaysali',
              theme: ThemeData(
                  colorScheme: lightColorScheme ?? defaultLightColorScheme,
                  useMaterial3: true,
                  scaffoldBackgroundColor: AppConstants.kDarkBk),
              darkTheme: ThemeData(
                  colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                  useMaterial3: true,
                  scaffoldBackgroundColor: AppConstants.kDarkBk),
              themeMode: ThemeMode.dark,
              home: const HomePage(),
            );
          });
        });
  }
}
