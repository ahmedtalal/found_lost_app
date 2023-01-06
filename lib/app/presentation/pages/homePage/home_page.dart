import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/categoriespage/categories_page.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/views/items_page.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/logic/home_page_controller.dart';
import 'package:found_lost_app/app/presentation/pages/homePage/widgets/bubble_items.dart';
import 'package:found_lost_app/app/presentation/pages/chatspage/chats_page.dart';
import 'package:found_lost_app/app/presentation/pages/additempage/add_item_page.dart';
import 'package:found_lost_app/app/presentation/pages/settingsPage/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [
    CategoriesPage(),
    ChatsPage(),
    AddItemPage(),
    ItemsPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
      init: HomePageController.instance,
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BubbleBottomBar(
            hasNotch: false,
            opacity: 0.9,
            currentIndex: controller.currentIndex.value,
            onTap: controller.switchPages,
            elevation: 3.0,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
            items: [
              //home page
              bubbleItems(
                title: "categories",
                backgroundColor: customeColor1,
                iamge: postImg,
              ),

              // search page
              bubbleItems(
                title: "chats",
                backgroundColor: customeColor2,
                iamge: chatImg,
              ),
              bubbleItems(
                title: "addItem",
                backgroundColor: customeColor3,
                iamge: addItemImg,
              ),
              bubbleItems(
                title: "my items",
                backgroundColor: customeColor4,
                iamge: itemsImg,
              ),
              bubbleItems(
                title: "settings",
                backgroundColor: customRedColor,
                iamge: settingsImg,
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            child: pages.elementAt(controller.currentIndex.value),
          ),
        );
      },
    );
  }
}
