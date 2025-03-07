import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/common/data/models/category/category_pagination_model.dart';
import 'package:cruftybay/features/common/data/models/category_list_model.dart';
import 'package:cruftybay/features/common/data/models/category_model.dart';
import 'package:cruftybay/features/common/data/models/pagination_model.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  bool get initialInProgress => _pageNumber == 1;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<CategoryItemModel> _categoryList = [];

  List<CategoryItemModel> get categoryList => _categoryList;

  final int _count = 30;
  int _pageNumber = 0;

  int? _lastPage;

  Future<bool> getCategoryList() async {
    _pageNumber++;
    if(_lastPage != null && _pageNumber > _lastPage!){
      return false;
    }

    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> queryParam = {'count': _count, 'page': _pageNumber};
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.categoryList,
      queryParams: queryParam,
    );
    if (response.isSuccess) {
      CategoryPaginationModel paginationModel = CategoryPaginationModel.fromJson(response.responseData);
      _categoryList.addAll(paginationModel.data?.results ?? []);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
