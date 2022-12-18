import 'package:flutter/material.dart';
import 'package:social_media_network/app/config/screen_handler.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
              // CustomTabBarSharedWidget(
              //   onClick: () {},
              //   title: "user Profile",
              //   icon: Icons.arrow_back,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
// class CustomTabBarSharedWidget extends StatelessWidget {
//   const CustomeTab({required this.onClick,required this.title,required this.icon,super.key,});
// final Function?() onClick;
// final String title ;
// final IconData icon 
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }