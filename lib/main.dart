import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/models/user_model.dart';
import 'package:flutter_riverpod_task_management/common/routes/routes.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/features/auth/controllers/user_controller.dart';
import 'package:flutter_riverpod_task_management/features/onboarding/pages/onboarding_page.dart';
import 'package:flutter_riverpod_task_management/features/todo/pages/home_page.dart';
import 'package:flutter_riverpod_task_management/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//com.googleusercontent.apps.440506479780-kh9up6omd97td97qsc0u1u3o7t5b377s

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    //getting users
    ref.read(userProvider.notifier).refresh();
    List<UserModel> users = ref.watch(userProvider);

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
              home: users.isEmpty ? const OnboardingPage() : const HomePage(),
              onGenerateRoute: Routes.onGenerateRoutes,
            );
          });
        });
  }
}
