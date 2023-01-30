import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_user/app/data/cache_provider.dart';
import 'package:wholesaler_user/app/modules/auth/password_reset/controller/password_reset_controller.dart';
import 'package:wholesaler_partner/app/modules/main/view/partner_main_view.dart';
import 'package:wholesaler_partner/app/modules/page3_my_info_mgmt/controllers/my_info_mgmt_controller.dart';
import 'package:wholesaler_user/app/modules/main/controllers/user_main_controller.dart';
import 'package:wholesaler_user/app/webrouter/my_router.dart';

class mFuctions {
  static void userLogout(BuildContext context) {
    CacheProvider cacheProvider = CacheProvider();
    // delete all Get Controllers
    Get.delete<PasswordResetController>();
    Get.delete<UserMainController>();

    cacheProvider.removeToken();
    cacheProvider.removeOwner();
    cacheProvider.removePrivilege();
    cacheProvider.removeRecentlyViewedProduct();

    context.go(MyRoutes.USERLOGIN);

  }

  static void storeLogout() {
    CacheProvider cacheProvider = CacheProvider();

    cacheProvider.removeFCMToken();
    cacheProvider.removeToken();
    cacheProvider.removeUserId();

    // cacheProvider.removeToken();
    // cacheProvider.removeOwner();
    // cacheProvider.removePrivilege();

  }
}
