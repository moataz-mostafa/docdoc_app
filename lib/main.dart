import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/cach_helper.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'features/recommendation/presentation/screens/recommendation_screen.dart';
import 'features/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.white,
      ),
      home: RecommendationScreen(),
      // home: const SplashScreen(),
    );
  }
}