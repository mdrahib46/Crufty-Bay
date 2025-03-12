import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/common/data/models/product_model.dart';
import 'package:cruftybay/features/product/data/model/product_list_pagination_model.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductListPaginationModel? _productListPaginationModel;

  List<ProductModel> get productList => _productListPaginationModel?.data?.results ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.productList);
    if (response.isSuccess) {
      _productListPaginationModel = ProductListPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
