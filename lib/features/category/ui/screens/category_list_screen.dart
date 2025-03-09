
import 'package:cruftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:cruftybay/features/common/ui/controllers/main_bottom_nab_controllers.dart';
import 'package:cruftybay/features/common/ui/widgets/category_item_widget.dart';
import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const String name = "/Category-List Screen";

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {

  final CategoryListController _categoryListController = Get.find<CategoryListController>();
  late  final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMoreDate);
    _categoryListController.getCategoryList();
    super.initState();
  }

  void  _loadMoreDate(){
    if(_scrollController.position.extentAfter < 300){
        _categoryListController.getCategoryList();
    }
  }


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
            Get.find<CategoryListController>().refreshCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (controller) {
              if(controller.initialInProgress){
                return const Center(child: CenterCircularProgressIndicator(),);
              }
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
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
                    ),
                  ),
                  Visibility(
                  visible: controller.inProgress,
                  child: const LinearProgressIndicator(),
                ),
              ],
            );
            }
          ),
        ),
      ),
    );
  }
}
