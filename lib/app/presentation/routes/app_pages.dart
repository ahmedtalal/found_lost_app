import 'package:found_lost_app/app/presentation/pages/additempage/add_item_page.dart';
import 'package:found_lost_app/app/presentation/pages/categoriespage/categories_page.dart';
import 'package:found_lost_app/app/presentation/pages/categoriespage/logic/getx/categories_binding.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/logic/getx/items_binding.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/views/items_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:found_lost_app/app/presentation/pages/auth/logic/getx/auth_binding.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/login_page_view.dart';
import 'package:found_lost_app/app/presentation/pages/auth/views/register_page_view.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/home_page.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/logic/home_page_binding.dart';
import 'package:found_lost_app/app/presentation/pages/splashscreen/splash_screen_page.dart';
import 'package:found_lost_app/app/presentation/pages/userprofile/userprofile_page.dart';
import 'package:found_lost_app/app/presentation/routes/app_routes.dart';
import 'package:found_lost_app/app/presentation/pages/userprofile/logic/getx/userprofile_binding.dart';
import 'package:found_lost_app/app/presentation/pages/additempage/logic/getx/add_item_report_binding.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreenRoute,
      page: () => const SplashScreenPage(),
    ),
    GetPage(
      name: AppRoutes.loginScreenRoute,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.registerScreenRoute,
      page: () => const RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreenRoute,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRoutes.userProfileRoute,
      page: () => const UserProfilePage(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.addItemReportRoute,
      page: () => const AddItemPage(),
      binding: AddItemReportBinding(),
    ),
    GetPage(
      name: AppRoutes.itemsReportRoute,
      page: () => const ItemsPage(),
      binding: ItemsBinding(),
    ),
    GetPage(
      name: AppRoutes.categoriesRoute,
      page: () => const CategoriesPage(),
      binding: CategoriesBinding(),
    )
  ];
}
