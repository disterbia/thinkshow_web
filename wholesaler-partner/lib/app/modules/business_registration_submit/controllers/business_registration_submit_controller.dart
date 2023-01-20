import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wholesaler_partner/app/data/api_provider.dart';
import 'package:wholesaler_user/app/models/product_image_model.dart';
import 'package:wholesaler_user/app/widgets/snackbar.dart';

class BusinessRegistrationSubmitController extends GetxController {
  pApiProvider _apiProvider = pApiProvider();
  XFile? _pickedImage;
  XFile? pickedImageToEdit;
  RxString uploadedImageURL = ''.obs;
  RxString uploadedImagePath = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> uploadImageBtnPressed() async {
    _pickedImage = await pickImage();
    bool result=await uploadImage();
    return result;
  }

  Future<XFile?> pickImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<bool> uploadImage() async {
    if (_pickedImage != null) {
      isLoading.value = true;
      pickedImageToEdit=_pickedImage;
      ProductImageModel response = await _apiProvider.postUploadBusinessRegisterImage(pickedImage: _pickedImage!);
      if (response.statusCode == 200) {
        isLoading.value = false;
       // mSnackbar(message: 'image_uploaded'.tr);
        uploadedImageURL.value = response.url;
        uploadedImagePath.value = response.path;
        log('uploadedImageURL $uploadedImageURL');
        return true;
      }else{
        isLoading.value = false;
        return false;
      }
    }else return false;
  }
}
