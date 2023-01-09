import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/widgets/loading_widget.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/dimens.dart';
import 'package:wholesaler_user/app/constants/styles.dart';
import 'package:wholesaler_user/app/modules/cart/controllers/cart1_shopping_basket_controller.dart';
import 'package:wholesaler_user/app/modules/cart/views/cart1_shopping_basket_view.dart';
import 'package:wholesaler_user/app/modules/page3_exhibition_products/view/exhibition_products_view.dart';
import 'package:wholesaler_user/app/modules/page3_moabogi/controllers/page3_moabogi_controller.dart';
import 'package:wholesaler_user/app/modules/search/views/search_page_view.dart';
import 'package:wholesaler_user/app/router/my_router.dart';
import 'package:wholesaler_user/app/widgets/category_tags/category_tags.dart';
import 'package:wholesaler_user/app/widgets/custom_appbar.dart';

class Page3MoabogiView extends GetView<Page3MoabogiController> {
  Page3MoabogiController ctr = Get.put(Page3MoabogiController());
  Cart1ShoppingBasketController ctr2 = Get.put(Cart1ShoppingBasketController());

  Page3MoabogiView();

  @override
  Widget build(BuildContext context) {
    ctr.getBannerData();
    ctr2.init(context);
    return Scaffold(
      appBar: _appbar(context),
      body: _body(context),
    );
  }

  Widget _body(context) => Obx(
        () => ctr.isLoading.value
            ? LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    HorizontalChipList().getIconTextList(
                        onPressed: (index) => ctr.chipPressed(index,context)),
                    _dingDongDeliveryBanner(),
                    Divider(thickness: 6, color: MyColors.grey3),
                    _imageList(context),
                  ],
                ),
              ),
      );

  // ####### DingDong delivery banner
  Widget _dingDongDeliveryBanner() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 80,
        width: Get.width,
        decoration: BoxDecoration(
            color: MyColors.grey5,
            borderRadius:
                BorderRadius.all(Radius.circular(MyDimensions.radius)),
            border: Border.all(color: MyColors.grey6)),
        child: Row(
          children: [
            SizedBox(width: 20),
            Image.asset(
              'assets/icons/ic_bell.png',
              width: 20,
            ),
            SizedBox(width: 10),
            Text(
              '띵동 배송',
              style: MyTextStyles.f16.copyWith(color: MyColors.black2),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'order_now_receive_tomorrow'.tr,
                  style: MyTextStyles.f14,
                ),
                SizedBox(height: 5),
                Text(
                  '12시전 주문시 내일 도착',
                  style: MyTextStyles.f12,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ctr.imageBanners.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 20),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                context.go("/productexhibition/${ctr.imageBanners[index].id}");
              },
              child: CachedNetworkImage(
                imageUrl: ctr.imageBanners[index].banner_img_url,
                width: Get.width,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return CustomAppbar(isBackEnable: false, title: 'See_all'.tr, actions: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: MyColors.black,
        ),
        onPressed: () {
          context.go(MyRoutes.SearchPageView);
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
                      context.go(MyRoutes.Cart1ShoppingBasketView);
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: MyColors.black,
                    )),
              )
            : IconButton(
                onPressed: () {
                  context.go(MyRoutes.Cart1ShoppingBasketView);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: MyColors.black,
                ),
              ),
      )
    ]);
  }
}
