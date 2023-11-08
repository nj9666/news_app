import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/my_colors.dart';
import 'package:news_app/constant/my_text_style.dart';
import 'package:news_app/controller/dashbaord_controller.dart';
import 'package:news_app/view/detail_screen/details_screen.dart';
import 'package:news_app/view/home_screen/components/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final con = Get.put(DashBoardController());

  @override
  void initState() {
    con.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.primary,
        title: const Text(
          'Home',
          style: MyTextStyle.heading2,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
          children: [
            Obx(
              () => GridView.builder(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                itemCount: con.newsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(() => DetailsScreen(data: con.newsList[index]));
                      },
                      child: NewsCard(data: con.newsList[index]));
                },
              ),
            ),
            if (con.loading.value == true) const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
