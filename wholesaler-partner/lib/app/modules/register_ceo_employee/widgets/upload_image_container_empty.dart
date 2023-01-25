import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/modules/business_registration_submit/views/business_registration_submit_view.dart';
import 'package:wholesaler_partner/app/router/my_router.dart';

import '../../business_registration_submit/controllers/business_registration_submit_controller.dart';

/// 아직 업로드 안 했던 이미지
class UploadImageContainer_empty extends StatelessWidget {
  const UploadImageContainer_empty();

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey,
      dashPattern: [5, 5],
      strokeWidth: 1,
      child: InkWell(
        onTap: () async{
          print(' tapped on business regi');
          // Get.delete<BusinessRegistrationSubmitController>();
          await GetStorage().write("isProcess", true);
          context.pushReplacement(PartnerRoutes.BusinessRegistrationSubmitView,extra: true);
          await GetStorage().write("isProcess", false);
        },
        child: Container(
          height: 120,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  child: Image.asset('assets/icons/ic_upload.png'),
                ),
                SizedBox(height: 10),
                Text('upload_business_registration_file'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
