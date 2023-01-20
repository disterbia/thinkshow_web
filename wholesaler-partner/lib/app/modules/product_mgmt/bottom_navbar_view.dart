import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/constant/enums.dart';
import 'package:wholesaler_partner/app/modules/product_mgmt/controller/product_mgmt_controller.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/dimens.dart';
import 'package:wholesaler_user/app/constants/styles.dart';
import 'package:wholesaler_user/app/data/cache_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_user/app/widgets/moutlined_button_widget.dart';
import 'package:wholesaler_user/app/widgets/two_buttons.dart';

class ProductMgmtBottmNavbar extends StatelessWidget {
  ProductMgmtBottmNavbar();

  ProductMgmtController ctr = Get.put(ProductMgmtController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(width: 5),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    if (ctr.products
                        .firstWhere(
                            (element) => ctr.productsId.first == element.id)
                        .isSoldout!
                        .value)
                      return _dialog(ProductMgmtButtons.restock,context);
                    else
                      return _dialog(ProductMgmtButtons.soldout,context);
                  });
            },
            child: ctr.products
                    .firstWhere((element) => ctr.productsId.first == element.id)
                    .isSoldout!
                    .value
                ? Text(ProductMgmtButtons.restock)
                : Text(ProductMgmtButtons.soldout),
          ),
        ),
        SizedBox(width: 10),
        // Expanded(
        //   child: mOutlinedButton(
        //     text: 'TOP10',
        //     onPressed: () {
        //       showDialog(
        //           context: Get.context!,
        //           builder: (context) {
        //             return _dialog(ProductMgmtButtons.top10);
        //           });
        //     },
        //   ),
        // ),
        SizedBox(width: 10),
        CacheProvider().isPrivilege()
            ? Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return _dialog(ProductMgmtButtons.dingdong,context);
                        });
                  },
                  child: Text('띵동'),
                ),
              )
            : SizedBox(),
        CacheProvider().isPrivilege() ? SizedBox(width: 10) : SizedBox.shrink(),
        Expanded(
          child: mOutlinedButton(
            text: '삭제',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _dialog(ProductMgmtButtons.delete,context);
                  });
            },
          ),
        ),
      ]),
    );
  }

  Widget _dialog(String text,BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(MyDimensions.radius),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 28.0, bottom: 10, right: 10, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('해당 제품을'),
            Text(
              text,
              style: MyTextStyles.f16.copyWith(color: MyColors.primary),
            ),
            Text('처리하시겠습니까?'),
            SizedBox(
              height: 20,
            ),
            TwoButtons(
                rightBtnText: 'ok'.tr,
                leftBtnText: 'cancel'.tr,
                rBtnOnPressed: () {
                  log('selected: $text');
                  if (text == ProductMgmtButtons.delete) {
                    ctr.deleteSelectedProducts(context);
                  } else if (text == ProductMgmtButtons.top10) {
                    ctr.addOrRemoveTop10SelectedProducts(context);
                  } else if (text == ProductMgmtButtons.soldout ||
                      text == ProductMgmtButtons.restock) {
                    ctr.soldOut(context);
                  } else if (text == ProductMgmtButtons.dingdong) {
                    ctr.addToDingDong(context);
                  }
                  ctr.isBottomNavbar.value = false;
                 context.pop();
                },
                lBtnOnPressed: () {
                 context.pop();
                })
          ],
        ),
      ),
    );
  }
}
