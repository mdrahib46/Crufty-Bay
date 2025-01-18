
import 'package:cruftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/common/ui/widgets/category_item_widget.dart';
import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
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
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (controller) {
              if(controller.inProgress){
                return const CenterCircularProgressIndicator();
              }
              return GridView.builder(
                itemCount: controller.categoryList.length,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return  FittedBox(
                    child: CategoryItemWidget(categoryModel: controller.categoryList[index],),
                  );
                },
              );
            }
          ),
        ),
      ),
    );
  }


  // this function is not working !
  // void _onPop() {
  //   Get.find<MainBottomNabController>().backToHome();
  // }
}
