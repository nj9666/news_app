import 'package:get/get.dart';
import 'package:news_app/api_serives/api_constant.dart';
import 'package:news_app/api_serives/api_services.dart';
import 'package:news_app/model/news_model.dart';

class DashBoardController extends GetxController {
  RxBool loading = false.obs;
  RxList<NewsData> newsList = <NewsData>[].obs;

  getNews() async {
    loading.value = true;
    var response = await ApiServices.getApiCAlls("${ApiConstant.getNewsUrl}api_token=DHnEg0hS3J91KF69rypJqq9JwqLiwKIgeCbfhAGP&locale=in&limit=15");
    if (response != null) {
      GetNewsModel newsModel;
      newsModel = GetNewsModel.fromJson(response);
      newsList.value = newsModel.data ?? [];
      loading.value = false;
    }
  }
}
