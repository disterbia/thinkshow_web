import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_user/app/data/api_provider.dart';
import 'package:wholesaler_user/app/data/cache_provider.dart';
import 'package:wholesaler_user/app/models/store_model.dart';
import 'package:wholesaler_user/app/modules/auth/user_login_page/views/user_login_view.dart';
import 'package:wholesaler_user/app/widgets/snackbar.dart';
import 'package:wholesaler_user/app/constants/functions.dart';

class Page2StoreListController extends GetxController {
  uApiProvider _apiProvider = uApiProvider();

  RxList<Store> stores = <Store>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getRankedStoreData(BuildContext context) async {
    Future.delayed(Duration.zero, () => isLoading.value = true);

    bool result = await uApiProvider().chekToken();

    if (!result) {
      print('logout');
      //mSnackbar(message: '로그인 세션이 만료되었습니다.');
      mFuctions.userLogout(context);
    } else {
      stores.value = await _apiProvider.getStoreRanking(offset: 0, limit: 80);
    }
    isLoading.value = false;
  }

  Future<void> getBookmarkedStoreData(BuildContext context) async {
    Future.delayed(Duration.zero, () => isLoading.value = true);

    bool result = await uApiProvider().chekToken();

    if (!result) {
      print('logout');
      //mSnackbar(message: '로그인 세션이 만료되었습니다.');
      mFuctions.userLogout(context);
    } else {
      stores.value = await _apiProvider.getStorebookmarked();
    }
    // if (CacheProvider().getToken().isEmpty) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Get.to(() => User_LoginPageView());
    //   });
    // } else {
    //   Future.delayed(Duration.zero,() => isLoading.value=true);

    //   stores.value = await _apiProvider.getStorebookmarked();
    // }

    isLoading.value = false;
  }

  Future<void> starIconPressed(Store store,BuildContext context) async {
    if (CacheProvider().getToken().isEmpty) {
      mFuctions.userLogout(context);
      return;
    }

    bool result = await uApiProvider().chekToken();
    if (!result) {
      print('logout');
     // mSnackbar(message: '로그인 세션이 만료되었습니다.');
      mFuctions.userLogout(context);
      return;
    }
    log('store id ${store.id}');
    bool isSuccess = await _apiProvider.putAddStoreFavorite(storeId: store.id);

    if (isSuccess) {
      if (store.isBookmarked!.value) {
        mSnackbar(message: '스토어 찜 설정이 완료되었습니다.',context: context);
      } else {
        mSnackbar(message: '스토어 찜 설정이 취소되었습니다.',context:context);
      }
    }
  }
}
