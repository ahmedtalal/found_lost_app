import 'package:flutter/material.dart';
import 'package:found_lost_app/app/config/screen_handler.dart';
import 'package:found_lost_app/app/core/constants/app_colors.dart';
import 'package:found_lost_app/app/core/constants/strings.dart';
import 'package:found_lost_app/app/presentation/pages/categoriespage/logic/getx/categories_controller.dart';
import 'package:found_lost_app/app/presentation/pages/itemspage/widgets/empty_item_reports_widget.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/custom_text_shared_widget.dart';
import 'package:get/get.dart';

import '../itemspage/views/item_type_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: ScreenHandler.getScreenHeight(context),
          width: ScreenHandler.getScreenWidth(context),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextSharedWidget(
                    textTitle: "Categories",
                    titleStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: appFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.notifications,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: customeColor2,
                    unselectedLabelColor: Colors.grey,
                    labelPadding: EdgeInsets.only(
                      right: ScreenHandler.getScreenWidth(context) / 18,
                      left: ScreenHandler.getScreenWidth(context) / 18,
                    ),
                    isScrollable: true,
                    indicator: CircleTabIndicator(
                      color: customeColor2,
                      radius: 3,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: appFont,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Found items'),
                      Tab(text: 'Lost Items'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: double.maxFinite,
                  width: ScreenHandler.getScreenWidth(context),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      GetX<CategoriesController>(
                          init: CategoriesController.instance,
                          // initState: (state) {
                          //   state.controller!.getAllItemReports();
                          // },
                          builder: (controller) {
                            if (controller.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (controller.itemReportsList.isEmpty) {
                              return EmptyItemReportsWidget();
                            }
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: controller.itemReportsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemReportView(
                                  itemReportModel:
                                      controller.itemReportsList[index],
                                );
                              },
                            );
                          }),
                      GetX<CategoriesController>(
                          init: CategoriesController.instance,
                          // initState: (state) {
                          //   state.controller!.getAllItemReports();
                          // },
                          builder: (controller) {
                            if (controller.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (controller
                                .foundItemReportsList.isEmpty) {
                              return EmptyItemReportsWidget();
                            }
                            return ListView.builder(
                              itemCount: controller.foundItemReportsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemReportView(
                                  itemReportModel:
                                      controller.foundItemReportsList[index],
                                );
                              },
                            );
                          }),
                      GetX<CategoriesController>(
                          init: CategoriesController.instance,
                          // initState: (state) {
                          //   state.controller!.getAllItemReports();
                          // },
                          builder: (controller) {
                            if (controller.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (controller.lostItemReportsList.isEmpty) {
                              return EmptyItemReportsWidget();
                            }
                            return ListView.builder(
                              itemCount: controller.lostItemReportsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemReportView(
                                  itemReportModel:
                                      controller.lostItemReportsList[index],
                                );
                              },
                            );
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  CircleTabIndicator({required this.color, required this.radius});
  //override createBoxPainter

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
//override paint
  final Color color;
  final double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
