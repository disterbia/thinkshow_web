import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_user/app/data/cache_provider.dart';
import 'package:wholesaler_user/app/modules/auth/password_reset/controller/password_reset_controller.dart';
import 'package:wholesaler_user/app/modules/auth/user_login_page/views/user_login_view.dart';
import 'package:wholesaler_user/app/modules/main/controllers/user_main_controller.dart';
import 'package:wholesaler_user/app/router/my_router.dart';

class mFuctions {
  static void userLogout(BuildContext context) {
    CacheProvider cacheProvider = CacheProvider();
    // delete all Get Controllers
    Get.delete<PasswordResetController>();
    Get.delete<UserMainController>();
    Get.delete<UserMainController>();

    cacheProvider.removeToken();
    cacheProvider.removeOwner();
    cacheProvider.removePrivilege();
    cacheProvider.removeRecentlyViewedProduct();

    context.go(MyRoutes.USERLOGIN);

  }
}
