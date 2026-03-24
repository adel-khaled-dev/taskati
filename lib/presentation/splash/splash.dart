// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/Function/navigator.dart';
import 'package:taskati/core/services/share_preferences.dart';
import 'package:taskati/core/widgets/image.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/presentation/Start/completeprofile.dart';
import 'package:taskati/presentation/home/page/home.dart';
import 'package:taskati/styles/styles.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      var image = Sharedprefs.getString(Sharedprefs.imageKey);
      var name = Sharedprefs.getString(Sharedprefs.nameKey);
      if (image.isNotEmpty && name.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        navigator(context, Completeprofile());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(ImagesApp.taskInmation),
              12.h,
              Text("Taskati", style: TextStyles.titel),
              18.h,
              Text("It’s time to get organized", style: TextStyles.hinttext),
            ],
          ),
        ),
      ),
    );
  }
}
