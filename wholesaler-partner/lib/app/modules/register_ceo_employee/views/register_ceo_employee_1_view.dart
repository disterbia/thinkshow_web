import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/router/my_router.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/widgets/custom_appbar.dart';
import 'package:wholesaler_user/app/widgets/custom_button.dart';

import '../controllers/register_ceo_employee_1_controller.dart';
import 'register_ceo_employee_2_view.dart';

class RegisterCeoEmployeePage1View extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: CustomAppbar(isBackEnable: false, title: 'SignUp'.tr,context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 103),
            Container(
              width: 64,
              height: 64,
              child: Image.asset('assets/icons/ic_exclamation.png'),
            ),
            SizedBox(height: 60),
            Center(child: Text('회원가입 유형에 따라 가입 절차가 다릅니다.')),
            Center(child: Text('가입을 원하는 회원 유형을 선택해 주세요.')),
            SizedBox(height: 80),
            // CEO Button
            CustomButton(
              onPressed: () async{
                await GetStorage().write("isEmployee", false);
                await GetStorage().write("isProcess", true);
                context.pushReplacement(PartnerRoutes.RegisterCeoEmployeePage2View);
                await GetStorage().write("isProcess", false);
              },
              text: 'CEO'.tr,
            ),

            SizedBox(height: 5),
            // Employee Button

            CustomButton(
              text: '직원',
              borderColor: MyColors.primary,
              backgroundColor: MyColors.white,
              textColor: MyColors.black,
              onPressed: () async {
                await GetStorage().write("isEmployee", true);
                await GetStorage().write("isProcess", true);
                context.pushReplacement(PartnerRoutes.RegisterCeoEmployeePage2View);
                await GetStorage().write("isProcess", false);
              },
            )
          ],
        ),
      ),
    );
  }
}
