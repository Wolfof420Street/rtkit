import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rtkit/firebase_options.dart';
import 'package:rtkit/home.dart';
import 'package:rtkit/storage_util.dart';
import 'package:rtkit/themes.dart';

import 'theme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await StorageUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer(
          builder: (context, ThemeModel themeNotifier, child) {
            return MaterialApp(
              theme: Themes.mainTheme,
              debugShowCheckedModeBanner: false,
              title: 'RealtimeKit',
              home: const MainPage(),
            );
          },
        ));
  }
}
