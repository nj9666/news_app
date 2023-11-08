import 'package:flutter/material.dart';
import 'package:news_app/constant/my_colors.dart';
import 'package:news_app/constant/my_text_style.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text(
          'News Details',
          style: MyTextStyle.heading2,
        ),
        centerTitle: true,
      ),
    );
  }
}
