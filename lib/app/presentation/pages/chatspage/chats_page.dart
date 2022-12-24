import 'package:flutter/material.dart';
import 'package:found_lost_app/app/presentation/shared/widgets/app_bar_shared_widget.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSharedWidget.instance.build(context),
      body: const Center(
        child: Text("marketplace page"),
      ),
    );
  }
}
