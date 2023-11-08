import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/my_colors.dart';
import 'package:news_app/constant/my_text_style.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/detail_screen/double_tappable_interactive_viewer.dart';

class DetailsScreen extends StatefulWidget {
  final NewsData data;
  const DetailsScreen({super.key, required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 25,
          backgroundColor: MyColors.primary,
          title: Text(
            widget.data.title ?? "",
            style: MyTextStyle.style15500,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                child: DoubleTappableInteractiveViewer(
                  scaleDuration: const Duration(milliseconds: 600),
                  child: CachedNetworkImage(
                    imageUrl: widget.data.imageUrl ?? "",
                    progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
