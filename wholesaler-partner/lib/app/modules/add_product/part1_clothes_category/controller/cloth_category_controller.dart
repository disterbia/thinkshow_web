import 'package:get/get.dart';
import 'package:wholesaler_partner/app/modules/add_product/controller/add_product_controller.dart';
import 'package:wholesaler_partner/app/modules/add_product/part2_image_sizetable_options/controller/part2_image_sizetable_options_controller.dart';
import 'package:wholesaler_user/app/models/cloth_category_model.dart';
import 'package:wholesaler_user/app/widgets/category_tags/cloth_category.dart';

class ClothCategoryController extends GetxController {
  AddProductController addProductController = Get.find<AddProductController>();
  AP_Part2Controller part2Controller = Get.find<AP_Part2Controller>();

  //에디터 다 클리어해줘야함;;

  clothCategorySelected(ClothCategoryModel subCat, ClothCategory clothCategory) {
    // print('asdfasdfasdf');
    addProductController.selectedSubCat.value = subCat;
    addProductController.category.value = clothCategory;
    addProductController.category.value.selectedSubcatIndex = clothCategory.subCategories.indexOf(subCat);
    addProductController.productModifyModel.value.subCategoryId = subCat.id;
    addProductController.isChangeCategoryInEditeMode.value = true;


    print(subCat.id);
    print(subCat.id);
    print(subCat.id);

    part2Controller.createProductBodySizeList(subCat.id);

    Get.back();
    Get.back();
  }
}