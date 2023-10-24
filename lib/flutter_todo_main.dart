import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_todo/colors.dart';
import 'package:todo_todo/controller/auth_controller.dart';
import 'package:todo_todo/firebase_options.dart';
import 'package:todo_todo/locator.dart';
import 'package:todo_todo/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FlutterTodoApp());
}

class FlutterTodoApp extends StatelessWidget {
  const FlutterTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locator<AuthController>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter-Todo',
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: kColorScheme).copyWith(
            background: kBackgroundColor,
            secondary: kSecondaryColor,
          ),
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
