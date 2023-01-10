import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/modules/add_product/controller/add_product_controller.dart';
import 'package:wholesaler_partner/app/modules/add_product/part1_clothes_category/controller/cloth_category_controller.dart';
import 'package:wholesaler_user/app/widgets/category_tags/cloth_category.dart';
import 'package:wholesaler_user/app/widgets/custom_appbar.dart';

class ClothCategoryView extends GetView<ClothCategoryController> {
  ClothCategoryController ctr = Get.put(ClothCategoryController());
  AddProductController addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: '상품등록', isBackEnable: true),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return ListView(
      children: [for (var category in ClothCategory.getAll()) _categoryItemBuilder(category,context)],
    );
  }

  Widget _categoryItemBuilder(ClothCategory category,BuildContext context) {
    return ListTile(
      onTap: () {
        addProductController.toSubCategoryListView(category,context);
      },
      title: Text(category.title),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: Image.asset(
        category.icon,
        width: 30,
        height: 30,
        fit: BoxFit.fill,
      ),
    );
  }
}
