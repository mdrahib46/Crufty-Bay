import 'package:cruftybay/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = "/Category-List Screen";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => Get.find<MainBottomNabController>().backToHome(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category List"),
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNabController>().backToHome() ;
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 4,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return const FittedBox(
              child: CategoryItemWidget(),
            );
          },
        ),
      ),
    );
  }


  // this function is not working !
  // void _onPop() {
  //   Get.find<MainBottomNabController>().backToHome();
  // }
}
