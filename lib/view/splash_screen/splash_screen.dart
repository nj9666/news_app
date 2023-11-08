import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/my_colors.dart';
import 'package:news_app/constant/my_text_style.dart';
import 'package:news_app/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(RoutesName.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.primary,
      body: Center(
        child: Text('NEWS APP', style: MyTextStyle.heading),
      ),
    );
  }
}
