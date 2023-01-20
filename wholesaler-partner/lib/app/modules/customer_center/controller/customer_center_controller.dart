import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wholesaler_partner/app/data/api_provider.dart';
import 'package:wholesaler_user/app/widgets/dialog.dart';
import 'package:wholesaler_user/app/widgets/two_buttons.dart';
import 'package:go_router/go_router.dart';

class CustomerCenterController extends GetxController {
  // partner apiprovider
  pApiProvider _apiProvider = pApiProvider();
  withdrawAccount(BuildContext context) {
    // show dialog
    mDialog(
      title: '탈퇴 요청',
      subtitle: '탈퇴 요청하시겠습니까?',
      twoButtons: TwoButtons(
          leftBtnText: '취소',
          rightBtnText: '탈퇴',
          lBtnOnPressed: () {
            context.pop();
          },
          rBtnOnPressed: () {
            _apiProvider.withdrawAccount();
          }),
    );
  }
}
