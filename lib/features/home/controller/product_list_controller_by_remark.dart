import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/common/data/models/product_list_model.dart';
import 'package:cruftybay/features/common/data/models/product_model.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class ProductListControllerByRemark extends GetxController {
  bool _popularInProgress = false;
  bool _newProductInProgress = false;
  bool _specialProductInProgress = false;

  bool get popularInProgress => _popularInProgress;

  bool get newProductInProgress => _newProductInProgress;

  bool get specialProductInProgress => _specialProductInProgress;

  ProductListModel? _popularProductModel;
  ProductListModel? _newProductModel;
  ProductListModel? _specialProductModel;

  List<ProductModel> get popularProductList => _popularProductModel?.productList ?? [];

  List<ProductModel> get newProductList => _newProductModel?.productList ?? [];

  List<ProductModel> get specialProductList => _specialProductModel?.productList ?? [];

  String? _popularErrorMessage;
  String? _newErrorMessage;
  String? _specialErrorMessage;

  String? get popularErrorMessage => _popularErrorMessage;

  String? get newErrorMessage => _newErrorMessage;

  String? get specialErrorMessage => _specialErrorMessage;

  Future<bool> gerProductListByRemark(String remark) async {
    bool isSuccess = false;

    if (remark == 'popular') {
      _popularInProgress = true;
    } else if (remark == 'new') {
      _newProductInProgress = true;
    } else {
      _newProductInProgress = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.productListByRemark(remark));
    if (response.isSuccess) {
      if (remark == 'popular') {
        _popularProductModel = ProductListModel.fromJson(response.responseData);
      } else if (remark == 'new') {
        _newProductModel = ProductListModel.fromJson(response.responseData);
      } else {
        _specialProductModel = ProductListModel.fromJson(response.responseData);
      }

      isSuccess = true;
    } else {
      if (remark == 'popular') {
        _popularErrorMessage = response.errorMessage;
      } else if (remark == 'new') {
        _newErrorMessage = response.errorMessage;
      } else {
        _specialErrorMessage = response.errorMessage;
      }
    }

    if (remark == "popular") {
      _popularInProgress = false;
    } else if (remark == 'new') {
      _newProductInProgress = false;
    } else {
      _specialProductInProgress = false;
    }

    update();
    return isSuccess;
  }
}
