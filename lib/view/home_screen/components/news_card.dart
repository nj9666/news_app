import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constant/my_text_style.dart';
import 'package:news_app/model/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.data});

  final NewsData data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          SizedBox(
            height: 180,
            child: CachedNetworkImage(
              imageUrl: data.imageUrl ?? "",
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(.8),
                ])),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                overflow: TextOverflow.ellipsis,
                data.title ?? "",
                style: MyTextStyle.style14500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
