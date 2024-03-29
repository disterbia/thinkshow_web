// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/router/my_router.dart';
import 'package:wholesaler_partner/app/widgets/loading_widget.dart';
import 'package:wholesaler_user/app/Constants/variables.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/styles.dart';
import 'package:wholesaler_user/app/models/review.dart';
import 'package:wholesaler_user/app/modules/review_detail/views/review_detail_view.dart';
import 'package:wholesaler_user/app/modules/review_list/controllers/review_list_controller.dart';
import 'package:wholesaler_user/app/webrouter/my_router.dart';
import 'package:wholesaler_user/app/widgets/custom_appbar.dart';
import 'package:wholesaler_user/app/widgets/product/product_item_horiz_widget.dart';

/// [Warning] Used in Partner app
class ReviewListView extends GetView<ReviewListController> {
  ReviewListController ctr = Get.put(ReviewListController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: CustomAppbar(
            isBackEnable: false, title: 'review'.tr, hasHomeButton: false),
        body: ctr.isLoading.value
            ? LoadingWidget()
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: ctr.reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      MyVars.isUserProject()?
                      context.go(MyRoutes.ReviewDetailView,extra: {
                        "selectedReviw": ctr.reviews[index],
                        "isComingFromReviewPage": true
                      }): context.go(PartnerRoutes.ReviewDetailView,extra: {
                        "selectedReviw": ctr.reviews[index],
                        "isComingFromReviewPage": true
                      });
                    },
                    child: ProductItemHorizontal.review(
                      review: ctr.reviews[index],
                      titleStyle:
                          MyTextStyles.f14.copyWith(color: MyColors.black1),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
      );
    });
  }
}
