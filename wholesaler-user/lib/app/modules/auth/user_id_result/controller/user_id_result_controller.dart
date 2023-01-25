import 'dart:developer';

import 'package:get/get.dart';

class UserIdResultController extends GetxController {
  RxString userId = ''.obs;
  bool isFirst= true;
  void init(String argument){
    if(!isFirst) return;
    userId.value = argument;
    isFirst=false;
  }
}
