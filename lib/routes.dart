import 'package:get/get.dart';

import 'package:task_6_ecommerce/core/constant/app_routes.dart';
import 'package:task_6_ecommerce/core/middleware/my_middleware.dart';
import 'package:task_6_ecommerce/view/auth/login/screen/login.dart';
import 'package:task_6_ecommerce/view/search/screen/search_screen.dart';

List<GetPage<dynamic>>? routes = [
  //================================ Auth ===========================================
  GetPage(
      name: AppRoutes.login,
      page: () =>  Login(),
      middlewares: [MyMiddleWare()]),
  GetPage(
    name: '/searchPage',
    page: () => SearchPage(),  // Replace with your SearchPage widget
  ),
];
