import 'package:get/get.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:news_app/view/new_detail_screen.dart/new_detail_screen.dart';
import 'package:news_app/view/splash_screen/splash_screen.dart';

class Routes {
  static final pageList = <GetPage>[
    GetPage(
      name: RoutesName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutesName.newsDetail,
      page: () => const NewsDetailScreen(),
    ),
  ];
}

// Routes name
class RoutesName {
  static const String home = "/home";
  static const String splash = "/splash";
  static const String newsDetail = "/news_detail";
}
