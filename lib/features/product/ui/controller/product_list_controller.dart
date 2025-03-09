import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController{


  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getProductList() async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.productList);
    if(response.isSuccess){

    }else{

    }
    return isSuccess;

  }
}