import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/homescreen.dart';
import 'Shared/styles/my_theme_data.dart';
import 'firebase_options.dart';
import 'preference_helper.dart';
import 'providers/my_provider.dart';
import 'tabs/FlashCard Quiz/flashcard_quiz_tab.dart';
import 'tabs/FlashCard Quiz/quiz_result.dart';
import 'tabs/FlashCard Quiz/quiz_tab.dart';
import 'tabs/Quiz Score Tab/quiz_score_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  PrefsHelper.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider()..init(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        locale: const Locale("en"),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          QuizScoreTab.routeName: (context) => const QuizScoreTab(),
          QuizTab.routeName: (context) => const QuizTab(),
          QuizResult.routeName: (context) => const QuizResult(),
          FlashCardQuizTab.routeName: (context) => const FlashCardQuizTab(),
        },
        darkTheme: MyThemeData.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
