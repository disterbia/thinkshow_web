import 'dart:developer';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/data/api_provider.dart';
import 'package:wholesaler_partner/app/router/my_router.dart';
import 'package:wholesaler_user/app/modules/auth/user_login_page/views/user_login_view.dart';
import 'package:wholesaler_user/app/widgets/snackbar.dart';

class RegisterCeoEmployee4Controller extends GetxController {
  pApiProvider apiProvider = pApiProvider();

  TextEditingController phoneNumCtr = TextEditingController();
  TextEditingController phoneNumVerifyCtr = TextEditingController();
  int certifi_id = 0;
  bool isPhoneVerifyFinished = false;

  RxBool isAgreeAll = false.obs;
  RxBool isAgreeCondition = false.obs;
  RxBool isAgreePrivacy = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> requestVerifyPhonePressed() async {
    if (phoneNumCtr.text.isEmpty) {
      //mSnackbar(message: '휴대폰 번호를 입력하세요.');
      return;
    }
    certifi_id = await apiProvider.postRequestVerifyPhoneNum(
        phoneNumber: phoneNumCtr.text);
    log('certifi_id is $certifi_id');
  }

  Future<void> verifyPhonePressed() async {
    log('verifyPhonePressed');
    isPhoneVerifyFinished = await apiProvider.putPhoneNumVerify(
        phoneNumber: phoneNumCtr.text,
        phoneNumVerify: phoneNumVerifyCtr.text,
        certifi_id: certifi_id);
  }

  Future<void> registerBtnPressed(BuildContext context) async {
    if (!isPhoneVerifyFinished) {
      mSnackbar(message: '인증번호를 입력하세요.'.tr,context: context);
      return;
    }
    if (isAgreeAll.isFalse) {
      mSnackbar(message: 'accept_both_terms_and_privacy'.tr,context: context);
      return;
    }

    if (certifi_id == 0) {
      mSnackbar(message: '휴대폰번호를 인증 하세요.',context: context);
      return;
    }

    bool isSuccess = await apiProvider.postCeoRegister();
    if (isSuccess) {
      mSnackbar(message: 'successfully_registered'.tr,context: context);
      Router.neglect(context, () {
        context.pushReplacementNamed(PartnerRoutes.USERLOGIN);
      });
    } else {
      mSnackbar(message: 'registration_failed'.tr,context: context);
    }
  }

  Future<void> employeeRegisterBtnPressed(BuildContext context) async {
    if (!isPhoneVerifyFinished) {
     mSnackbar(message: 'verify_your_mobile_phone_number'.tr,context: context);
      return;
    }
    if (isAgreeAll.isFalse) {
      mSnackbar(message: 'accept_both_terms_and_privacy'.tr,context: context);
      return;
    }

    if (certifi_id == 0) {
      mSnackbar(message: '휴대폰번호를 인증 하세요.',context: context);
      return;
    }

    bool isSuccess = await apiProvider.postStaffRegister();
    if (isSuccess) {
     mSnackbar(message: 'successfully_registered'.tr,context: context);
     Router.neglect(context, () {
       context.pushReplacementNamed(PartnerRoutes.USERLOGIN);
     });
    } else {
      mSnackbar(message: 'registration_failed'.tr,context: context);
    }
  }
}
