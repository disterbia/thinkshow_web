import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/data/api_provider.dart';
import 'package:wholesaler_partner/app/modules/register_ceo_employee/controllers/register_ceo_employee_1_controller.dart';
import 'package:wholesaler_partner/app/modules/register_ceo_employee/views/register_ceo_employee_4_view.dart';
import 'package:wholesaler_partner/app/router/my_router.dart';
import 'package:wholesaler_user/app/widgets/snackbar.dart';

import '../../business_registration_submit/controllers/business_registration_submit_controller.dart';

class RegisterCeoEmployee3Controller extends GetxController {

  TextEditingController companyNameCtr = TextEditingController();
  TextEditingController ceoNameCtr = TextEditingController();
  TextEditingController idCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController passwordVerifyCtr = TextEditingController();
  TextEditingController BusinessRegisterNumCtr = TextEditingController();

  pApiProvider apiProvider = pApiProvider();

  late bool _isIdDuplicated;

  @override
  void onInit() {
    super.onInit();
  }

  verifyIdPressed(BuildContext context) async {
    if (isIdLengthCorrect(context)) {
      return;
    }
    apiProvider.getVerifyId(userId: idCtr.text).then((val) {
      _isIdDuplicated = val;
      if (_isIdDuplicated) {
        showDuplicatedIdError(context);
      } else {
        showIdSuccessfulSnackbar(context);
      }
    });
  }

  bool isIdLengthCorrect(BuildContext context) {
    if (idCtr.text.length < 5 || idCtr.text.length > 20) {
      mSnackbar(message: '아이디는 최소 5자 최대 20자를 입력하세요.',context: context);
      return true;
    } else {
      return false;
    }
  }

  void showDuplicatedIdError(BuildContext context) {
    mSnackbar(message: '이미 등록 된 아이디 입니다.',context: context);
  }

  void showIdSuccessfulSnackbar(BuildContext context) {
   mSnackbar(message: '사용 가능한 아이디 입니다.',context: context);
  }

  void nextBtnPressed(BuildContext context) {
    bool isEmployee = GetStorage().read("isEmployee");
    if (companyNameCtr.text.isEmpty && !isEmployee) {
      mSnackbar(message: '상호명을 입력하세요.',context: context);
      return;
    }
    if (ceoNameCtr.text.isEmpty) {
      mSnackbar(message: '이름을 입력하세요.',context: context);
      return;
    }
    if (idCtr.text.length < 5 || idCtr.text.length > 20) {
      mSnackbar(message: '아이디는 최소 5자 최대 20자를 입력하세요.',context: context);
      return;
    }
    if (idCtr.text.isEmpty) {
      mSnackbar(message: '아이디를 입력하세요.',context: context);
      return;
    }
    if (passwordCtr.text.isEmpty) {
      mSnackbar(message: '비밀번호를 입력하세요.',context: context);
      return;
    }
    if (passwordCtr.text.length < 8) {
      mSnackbar(message: '비밀번호 8자 이상 입력해주세요.',context: context);
      return;
    }
    if (passwordVerifyCtr.text.isEmpty) {
      mSnackbar(message: '비밀번호 확인을 입력하세요.',context: context);
      return;
    }
    if (passwordCtr.text != passwordVerifyCtr.text) {
      mSnackbar(message: '암호가 일치하는지 확인하십시오.',context: context);
      return;
    }
    if (BusinessRegisterNumCtr.text.isEmpty &&
        !isEmployee) {
      mSnackbar(message: '사업자등록번호를 입력하세요.',context: context);
      return;
    }
    if (BusinessRegisterNumCtr.text.length != 10 &&
        !isEmployee) {
      mSnackbar(message: '사업자등록번호 10자리를 입력하세요.',context: context);
      return;
    }
    if (Get.find<BusinessRegistrationSubmitController>()
            .uploadedImageURL
            .isEmpty &&
        !isEmployee) {
      mSnackbar(message: '사업자등록증 이미지를 업로드하세요.',context: context);
      return;
    }
    if (_isIdDuplicated) {
      showDuplicatedIdError(context);
      return;
    }
    context.pushReplacement(PartnerRoutes.RegisterCeoEmployeePage4View);
  }
}
