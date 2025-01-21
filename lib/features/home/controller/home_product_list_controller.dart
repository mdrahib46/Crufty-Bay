import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/common/data/models/product_list_model.dart';
import 'package:cruftybay/features/common/data/models/product_model.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class ProductListByRemarkController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  ProductListModel? _productListModel;

  List<ProductModel> get productList => _productListModel?.productList ?? [];

  Future<bool> getProductList() async {
    bool isSuccess = false;
    _inProgress = false;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.productListByRemark('Popular'));
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = false;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
