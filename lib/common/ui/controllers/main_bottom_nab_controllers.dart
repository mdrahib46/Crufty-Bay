import 'package:get/get.dart';


class MainBottomNabController extends GetxController{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;


  void changedIndex(int index){
    if(index == _selectedIndex){
      return;
    }
    _selectedIndex = index;
    update();
  }
}