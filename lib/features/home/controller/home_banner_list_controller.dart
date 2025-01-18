import 'package:cruftybay/app/urls.dart';
import 'package:cruftybay/features/home/data/model/bannner_model.dart';
import 'package:cruftybay/features/home/data/model/home_banner_list_model.dart';
import 'package:cruftybay/services/networkcaller/network_response.dart';
import 'package:cruftybay/services/networkcaller/networkcaller.dart';
import 'package:get/get.dart';

class HomeCarouselSliderController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  BannerListModel? _bannerListModel;

  List<BannerModel> get bannerList => _bannerListModel?.bannerList ?? [];



  Future<bool> getHomeBannerList() async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.homeBannerList);
    if(response.isSuccess){
      _bannerListModel = BannerListModel.fromJson(response.responseData);
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();


    return isSuccess;

  }

}