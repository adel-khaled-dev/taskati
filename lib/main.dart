import 'package:flutter/material.dart';
import 'package:taskati/core/services/hive.dart';
import 'package:taskati/core/widgets/image.dart';
import 'package:taskati/core/services/share_preferences.dart';
import 'package:taskati/presentation/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
            Image.asset(
              ImagesApp.primaryImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            child ?? Container(),
          ],
        );
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedprefs.init();
  await HiveHelpar.init();
  runApp(MyApp());
}
