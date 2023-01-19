// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/dimens.dart';
import 'package:wholesaler_user/app/constants/styles.dart';
import 'package:wholesaler_user/app/constants/variables.dart';
import 'package:wholesaler_user/app/models/product_model.dart';
import 'package:wholesaler_user/app/models/review.dart';
import 'package:wholesaler_user/app/modules/cart/controllers/cart1_shopping_basket_controller.dart';
import 'package:wholesaler_user/app/modules/cart/views/cart1_shopping_basket_view.dart';
import 'package:wholesaler_user/app/modules/review_detail/controllers/review_detail_controller.dart';
import 'package:wholesaler_user/app/modules/search/views/search_page_view.dart';
import 'package:wholesaler_user/app/utils/utils.dart';
import 'package:wholesaler_user/app/widgets/custom_appbar.dart';
import 'package:wholesaler_user/app/widgets/product/product_item_horiz_widget.dart';
import 'package:wholesaler_user/app/widgets/two_buttons.dart';

class ReviewDetailView extends GetView {
  ReviewDetailController ctr = Get.put(ReviewDetailController());
  Cart1ShoppingBasketController ctr2 = Get.put(Cart1ShoppingBasketController());

  bool isEditing;

  ReviewDetailView(
      {this.isEditing = false,
        required Review selectedReviw,
        Product? product,
        required bool isComingFromReviewPage}) {
    ctr.init(
        tempSelectedReviw: selectedReviw,
        isComingFromOrderInquiryPage: isComingFromReviewPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: _appbar(),
      body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    print('ctr.selectedReviw!.value');
    print(ctr.selectedReviw!.value);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            _userId(),
            SizedBox(height: 10),
            Obx(() => ctr.price != (-1) ? _productItemBuilder() : Container()),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _rateBar(),
                _date(),
              ],
            ),
            SizedBox(height: 20),
            Text('내용'),
            SizedBox(height: 5),
            _reviewInputfield(),
            SizedBox(height: 30),
            Obx(() => ctr.reviewImageUrl != ''
                ? ctr.selectedReviw!.value.reviewImageUrl != null
                ? _attachmentPicture(context)
                : MyVars.isUserProject()
                ? emptyReviewImageHolder(context)
                : Container()
                : emptyReviewImageHolder(context)),
            SizedBox(height: 40),
            _bottomButtonsBuilder(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _userId() {
    return MyVars.isUserProject()
        ? SizedBox.shrink()
        : Text(
      ctr.selectedReviw!.value.writer != null
          ? ctr.selectedReviw!.value.writer!
          : "id",
      style: MyTextStyles.f16.copyWith(color: MyColors.black2),
    );
  }

  Widget _productItemBuilder() {
    int totalPrice = ctr.price.value +
        ctr.selectedReviw!.value.product.selectedOptionAddPrice!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ProductItemHorizontal(product: ctr.selectedReviw!.value.product),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Utils.numberFormat(number: ctr.price.value, suffix: '원'),
              style: MyTextStyles.f12,
            ),
            SizedBox(height: 5),
            Text(
              Utils.numberFormat(number: totalPrice, suffix: '원'),
              style: MyTextStyles.f16.copyWith(color: MyColors.black2),
            ),
          ],
        )
      ],
    );
  }

  Widget _rateBar() {
    return Obx(
          () => RatingBar.builder(
        ignoreGestures: !MyVars.isUserProject(), // disable gesture to rate
        initialRating: ctr.selectedReviw!.value.rating,
        direction: Axis.horizontal,
        itemSize: 20,
        itemCount: 5,
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print('rating $rating');
          ctr.selectedReviw!.value.rating = rating;
          print(
              'ctr.selectedReviw!.value.rating ${ctr.selectedReviw!.value.rating}');
        },
      ),
    );
  }

  Widget _date() {
    return Text(
      ctr.selectedReviw!.value.createdAt!,
      style: MyTextStyles.f12.copyWith(color: MyColors.grey2),
    );
  }

  Widget _reviewInputfield() {
    ctr.contentController.text = ctr.selectedReviw!.value.content;

    return TextField(
      readOnly: !MyVars.isUserProject(),
      controller: ctr.contentController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MyDimensions.radius),
        ),
      ),
      maxLines: 5,
    );
  }

  Widget emptyReviewImageHolder(BuildContext context) {
    return InkWell(
      onTap: () => ctr.uploadReviewImagePressed(context),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              color: MyColors.grey4,
              size: 100,
            ),
            Text('submit_review_image'.tr)
          ],
        ),
        height: 150,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.desc),
            borderRadius:
            BorderRadius.all(Radius.circular(MyDimensions.radius))),
      ),
    );
  }

  Widget _attachmentPicture(BuildContext context) {
    return Obx(
          () => InkWell(
        onTap: () => ctr.uploadReviewImagePressed(context),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: ctr.selectedReviw!.value.reviewImageUrl!,
                width: Get.width,
                fit: BoxFit.fitWidth,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return CustomAppbar(isBackEnable: true, title: 'review'.tr, actions: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: MyColors.black,
        ),
        onPressed: () {
          Get.to(() => SearchPageView());
        },
      ),
      Obx(
            () => ctr2.getNumberProducts() != 0
            ? Badge(
          badgeColor: MyColors.primary,
          badgeContent: Text(
            ctr2.getNumberProducts().toString(),
            style: TextStyle(
                color: MyColors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold),
          ),
          toAnimate: false,
          position: BadgePosition.topEnd(top: 5, end: 5),
          child: IconButton(
              onPressed: () {
                Get.to(() => Cart1ShoppingBasketView());
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: MyColors.black,
              )),
        )
            : IconButton(
          onPressed: () {
            Get.to(() => Cart1ShoppingBasketView());
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: MyColors.black,
          ),
        ),
      )
    ]);
  }

  _bottomButtonsBuilder(BuildContext context) {
    return MyVars.isUserProject()
        ? isEditing
    // editing review
        ? TwoButtons(
        rightBtnText: '수정',
        leftBtnText: '취소',
        rBtnOnPressed: () => ctr.reviewEditPressed(context),
        lBtnOnPressed: () {
          Get.back();
          Get.back();
        })
    // new review
        : SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ctr.reviewAddBtnPressed(context);

        },
        child: Text('추가'),
      ),
    )
        : SizedBox.shrink();
  }
}