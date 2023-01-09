import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/modules/add_product/controller/add_product_controller.dart';
import 'package:wholesaler_partner/app/modules/add_product/part2_image_sizetable_options/controller/part2_image_sizetable_options_controller.dart';
import 'package:wholesaler_partner/app/modules/add_product/part6_bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:wholesaler_partner/app/modules/product_mgmt/view/product_mgmt_view.dart';
import 'package:wholesaler_partner/app/widgets/loading_widget.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/styles.dart';
import 'package:wholesaler_user/app/widgets/two_buttons.dart';

class AP_Part6View extends GetView<AP_Part6Controller> {
  AP_Part6Controller ctr = Get.put(AP_Part6Controller());
  AP_Part2Controller part2controller = Get.put(AP_Part2Controller());
  AddProductController addProductCtr = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: MyColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TwoButtons(
                leftBtnText: 'go_back'.tr,
                rightBtnText:
                    addProductCtr.isEditing.isTrue ? '수정하기' : '상품등록하기',
                lBtnOnPressed: () {
                  showDialog(
                      context: Get.context!,
                      builder: (context) {
                        return _saveDialog(
                            title: '상품등록중입니다. 상품등록화면에서 나가시겠습니까?',
                            subtitle:
                                '* 확인을 누르시면 입력중인 상품정보가 삭제되고 상품등록이 완료되지 않습니다',
                            isCloseBtnPressed: true);
                      });
                },
                rBtnOnPressed: () {
                  //part2controller.isOptionCheckbox.value = true;

                  showDialog(
                      context: Get.context!,
                      builder: (context) {
                        return _saveDialog(
                            title: addProductCtr.isEditing.isTrue
                                ? '상품 수정을 완료하시겠습니까?'
                                : '상품 등록을 완료하시겠습니까?',
                            isCloseBtnPressed: false);
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog _saveDialog(
      {required String title,
      String? subtitle,
      required bool isCloseBtnPressed}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: MyTextStyles.f16.copyWith(color: MyColors.black2),
                  ),
                  subtitle != null
                      ? Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              subtitle,
                              style: MyTextStyles.f14
                                  .copyWith(color: MyColors.red),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: ctr.isLoading.value
                        ? LoadingWidget()
                        : TwoButtons(
                            leftBtnText: 'cancel'.tr,
                            rightBtnText: 'ok'.tr,
                            lBtnOnPressed: () {
                              Get.back();
                            },
                            rBtnOnPressed: () {
                              if (isCloseBtnPressed) {
                                Get.back();
                                Get.back();
                              } else {
                                //ctr.addProduct();
                              }
                            },
                          ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
