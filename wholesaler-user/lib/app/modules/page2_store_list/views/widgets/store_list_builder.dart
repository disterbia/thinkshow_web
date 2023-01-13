import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/widgets/loading_widget.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/styles.dart';
import 'package:wholesaler_user/app/models/store_model.dart';
import 'package:wholesaler_user/app/modules/page2_store_detail/view/store_detail_view.dart';
import 'package:wholesaler_user/app/modules/page2_store_list/controllers/shopping_controller.dart';
import 'package:wholesaler_user/app/webrouter/my_router.dart';

class StoreListBuilder extends StatelessWidget {
  Page2StoreListController ctr = Get.put(Page2StoreListController());
  String? prevPage;
  StoreListBuilder({String? prevPage}){
    print(prevPage);
    this.prevPage = prevPage;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ctr.isLoading.value?LoadingWidget():ListView.builder(
          itemCount: ctr.stores.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _storeList(ctr.stores[index],context);
          }),
    );
  }

  Widget _storeList(Store store,BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/store/${store.id}",extra: prevPage);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: MyColors.grey6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              _storeRankNum(store),
              SizedBox(width: 15),
              _storeImage(store),
              SizedBox(width: 14),
              _storeName(store),
            ]),
            _starBuilder(store,context),
          ]),
        ),
      ),
    );
  }

  Widget _storeRankNum(Store store) {
    return Container(
        width: 20,
        child: Text(
          store.rank.toString(),
          style: MyTextStyles.f16.copyWith(color: MyColors.grey8),
        ));
  }

  Widget _storeImage(Store store) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: store.imgUrl != null
          ? CachedNetworkImage(
              imageUrl: store.imgUrl!.value,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          : Image.asset(
              'assets/icons/ic_store.png',
              width: 60,
            ),
    );
  }

  Widget _storeName(Store store) {
    return Text(
      store.name!,
      style: MyTextStyles.f16.copyWith(color: MyColors.black3),
    );
  }

  Widget _starBuilder(Store store,BuildContext context) {
    return GestureDetector(
      onTap: () {
        store.isBookmarked!.toggle();
        ctr.starIconPressed(store,context);
      },
      child: Obx(
        () => Icon(
          store.isBookmarked!.isTrue ? Icons.star : Icons.star_border,
          color: MyColors.primary,
        ),
      ),
    );
  }
}
