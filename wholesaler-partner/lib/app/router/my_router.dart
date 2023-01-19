import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/models/product_inquiry_model.dart';
import 'package:wholesaler_partner/app/modules/ad/tab2_ad_application/view/tab2_ad_application_view.dart';
import 'package:wholesaler_partner/app/modules/ad/views/ad_view.dart';
import 'package:wholesaler_partner/app/modules/ad_impression/views/ad_impression_view.dart';
import 'package:wholesaler_partner/app/modules/ad_order/views/ad_order_view.dart';
import 'package:wholesaler_partner/app/modules/add_product/add_product_view.dart';
import 'package:wholesaler_partner/app/modules/add_product/part1_clothes_category/view/cloth_category_items_view.dart';
import 'package:wholesaler_partner/app/modules/add_product/part1_clothes_category/view/cloth_category_view.dart';
import 'package:wholesaler_partner/app/modules/business_license/view/business_edit_view.dart';
import 'package:wholesaler_partner/app/modules/business_license/view/business_view.dart';
import 'package:wholesaler_partner/app/modules/business_name/view/business_name_view.dart';
import 'package:wholesaler_partner/app/modules/business_registration_submit/views/business_registration_submit_view.dart';
import 'package:wholesaler_partner/app/modules/change_number/view/change_number_view.dart';
import 'package:wholesaler_partner/app/modules/customer_center/view/customer_center_view.dart';
import 'package:wholesaler_partner/app/modules/dingdong_delivery/views/dingdong_delivery_view.dart';
import 'package:wholesaler_partner/app/modules/employee_mgmt/views/employee_mgmt_view.dart';
import 'package:wholesaler_partner/app/modules/main/view/partner_main_view.dart';
import 'package:wholesaler_partner/app/modules/my_bank_account_mgmt/views/my_bank_account_mgmt_view.dart';
import 'package:wholesaler_partner/app/modules/page3_my_info_mgmt/views/my_info_mgmt_view.dart';
import 'package:wholesaler_partner/app/modules/page3_my_info_mgmt/views/my_page_down.dart';
import 'package:wholesaler_partner/app/modules/payment/views/payment_view.dart';
import 'package:wholesaler_partner/app/modules/product_inquiry_detail/view/product_inquiry_detail_view.dart';
import 'package:wholesaler_partner/app/modules/product_inquiry_list/view/product_inquiry_list_view.dart';
import 'package:wholesaler_partner/app/modules/product_mgmt/filter/product_filter_view.dart';
import 'package:wholesaler_partner/app/modules/product_mgmt/view/product_mgmt_view.dart';
import 'package:wholesaler_partner/app/modules/register_ceo_employee/views/register_ceo_employee_1_view.dart';
import 'package:wholesaler_partner/app/modules/register_ceo_employee/views/register_ceo_employee_2_view.dart';
import 'package:wholesaler_partner/app/modules/register_ceo_employee/views/register_ceo_employee_3_view.dart';
import 'package:wholesaler_partner/app/modules/register_ceo_employee/views/register_ceo_employee_4_view.dart';
import 'package:wholesaler_partner/app/modules/sales_mgmt/views/sales_mgmt_view.dart';
import 'package:wholesaler_partner/app/modules/top_10_products/views/top_10_products_view.dart';
import 'package:wholesaler_user/app/Constants/enum.dart';
import 'package:wholesaler_user/app/constants/variables.dart';
import 'package:wholesaler_user/app/data/cache_provider.dart';
import 'package:wholesaler_user/app/models/checkout_model/checkout_model.dart';
import 'package:wholesaler_user/app/modules/auth/find_id_find_password/views/find_id_find_password_view.dart';
import 'package:wholesaler_user/app/modules/auth/register_privacy_terms/views/register_privacy_terms_view.dart';
import 'package:wholesaler_user/app/modules/auth/user_login_page/views/user_login_view.dart';
import 'package:wholesaler_user/app/modules/auth/user_sign_up/views/user_sign_up_view.dart';
import 'package:wholesaler_user/app/modules/bulletin_detail/views/bulletin_detail_view.dart';
import 'package:wholesaler_user/app/modules/bulletin_list/views/bulletin_list_view.dart';
import 'package:wholesaler_user/app/modules/cart/payment/payment.dart';
import 'package:wholesaler_user/app/modules/cart/views/cart1_shopping_basket_view.dart';
import 'package:wholesaler_user/app/modules/cart/views/cart2_payment_view.dart';
import 'package:wholesaler_user/app/modules/faq/views/faq_view.dart';
import 'package:wholesaler_user/app/modules/main/view/user_main_view.dart';
import 'package:wholesaler_user/app/modules/my_page_update_password/views/my_page_update_password_view.dart';
import 'package:wholesaler_user/app/modules/order_details/views/order_details_view.dart';
import 'package:wholesaler_user/app/modules/order_inquiry_and_review/views/order_inquiry_and_review_view.dart';
import 'package:wholesaler_user/app/modules/page1_home/views/tabs/tab4_ding_dong.dart';
import 'package:wholesaler_user/app/modules/page2_store_detail/view/store_detail_view.dart';
import 'package:wholesaler_user/app/modules/page3_exhibition_products/view/exhibition_products_view.dart';
import 'package:wholesaler_user/app/modules/page3_product_category_page/view/product_category_page_view.dart';
import 'package:wholesaler_user/app/modules/page4_favorite_products/views/page4_favorite_products_view.dart';
import 'package:wholesaler_user/app/modules/page5_my_page/company_intro_page/view/company_intro_view.dart';
import 'package:wholesaler_user/app/modules/page5_my_page/inquiries_page/view/inquiries_page_view.dart';
import 'package:wholesaler_user/app/modules/page5_my_page/views/my_Page_settings_view.dart';
import 'package:wholesaler_user/app/modules/page5_my_page/views/my_page_down.dart';
import 'package:wholesaler_user/app/modules/point_mgmt/views/point_mgmt_view.dart';
import 'package:wholesaler_user/app/modules/product_detail/views/Product_detail_view.dart';
import 'package:wholesaler_user/app/modules/review_detail/views/review_detail_view.dart';
import 'package:wholesaler_user/app/modules/review_list/views/review_list_view.dart';
import 'package:wholesaler_user/app/modules/search/views/search_page_view.dart';
import 'package:wholesaler_user/app/modules/splash_screen/view/splash_screen_view.dart';
import 'package:wholesaler_user/app/widgets/category_tags/cloth_category.dart';

class PartnerRoutes {
  static const PartnerMainView = '/';
  static const USERLOGIN = '/login';
  static const ProductDetailView = '/product/:id';
  static const DingdongDeliveryView = "/dingdongDelivery";
  static const ProductInquiryDetailView = '/productinquiry';
  static const AdOrderView = "/adorder/:id";
  static const EditProductView = "/editproduct/:id";
  static const AddProductView = "/addproduct";
  static const ProductMgmtView = "/productmgt";
  static const SalesMgmtView = "/salesmgt";
  static const Top10ProductsView = "/top10product";
  static const MyPageDownP = "/seunghan";
  static const PaymentView = "/payment";
  static const BusinessEditView = "/businessedit";
  static const AdView = "/ad/:id";
  static const Tab2AdApplicationView = "/tab2adapp/:id";
  static const PointMgmtView = "/pointmgmt";
  static const MyInfoMgmtView = "/myinfomgmt";
  static const User_RegisterPrivacyTermsView = "/userregister";
  static const AdImpressionView="/adimpression";
  static const MyBankAccountMgmtView="/mybanckaccount";
  static const BusinessView = "/business";
  static const BusinessInfo = "/businessinfo";
  static const EmployeeMgmtView = "/employeemgmt";
  static const ProductInquiryListView = "/productinquirylist";
  static const ReviewListView = "/reviewlist";
  static const BulletinListView="/bulletlist";
  static const CustomerCenterView = "/customercenter";
  static const ClothCategoryItemsView = "/clothcategoryitem";
  static const ClothCategoryView = "/clothcategory";
  static const ProductMgmtFilterView = "/productmgmtfilter";
  static const RegisterCeoEmployeePage1View = "/registerceoemployeepage1";
  static const RegisterCeoEmployeePage2View = "/registerceoemployeepage2";
  static const RegisterCeoEmployeePage3View = "/registerceoemployeepage3";
  static const RegisterCeoEmployeePage4View = "/registerceoemployeepage4";
  static const BusinessRegistrationSubmitView = "/businessregistrationsubmit";
  static const User_FindID_FindPasswordView = "/findinfo";
  static const User_SignUpView = "/signup";

  static const ChangeNumberView= "/changenumber";
  static const ReviewDetailView = '/reviewdetail';
}

class PartnerPages {
  static late final partnerRouter = GoRouter(
    redirect: (context, state) {
      bool isProcess = GetStorage().read("isProcess")??true;
      if (CacheProvider().getToken().isEmpty &&
          state.subloc != "/registerceoemployeepage1" && state.subloc != "/registerceoemployeepage2" &&
          state.subloc != "/registerceoemployeepage3" && state.subloc != "/registerceoemployeepage4" &&
          state.subloc != "/findinfo" && state.subloc != "/businessregistrationsubmit") {
        return "/login";
      }
      if(!isProcess&& (state.subloc == "/registerceoemployeepage2" ||
      state.subloc == "/registerceoemployeepage3" || state.subloc == "/registerceoemployeepage4")){
        return "/registerceoemployeepage1";
      }
      if (state.subloc == "/login" && CacheProvider().getToken().isNotEmpty) {
        return "/";
      }
      // if(state.subloc=="/") {
      //   bool isLogin =  CacheProvider().getToken().isNotEmpty;
      //   if(isLogin) return "/";
      //   else return "/login";
      // }
    },
    errorBuilder: (context, state) => Container(
      child: Text("dd"),
    ),
    routes: [
      GoRoute(
          path: PartnerRoutes.PartnerMainView,
          builder: (context, state) => PartnerMainView()),
      GoRoute(
          path: PartnerRoutes.USERLOGIN,
          builder: (context, state) => User_LoginPageView()),
      GoRoute(
          path: PartnerRoutes.DingdongDeliveryView,
          builder: (context, state) => DingdongDeliveryView()),
      GoRoute(
          path: PartnerRoutes.AdOrderView,
          builder: (context, state) => AdOrderView(id: int.parse(state.params["id"]!),)
      ),
      GoRoute(
          path: PartnerRoutes.AddProductView,
          builder: (context, state) => AddProductView()
      ),
      GoRoute(
          path: PartnerRoutes.EditProductView,
          builder: (context, state) => AddProductView(argument: int.parse(state.params["id"]!))
      ),
      GoRoute(
          path: PartnerRoutes.ProductMgmtView,
          builder: (context, state)  {
            // if(state.extra==null) return ProductMgmtView();
            // Map<String,dynamic>? temp =state.extra as Map<String,dynamic>;
            GetStorage temp = GetStorage();
            print(temp.read("isRegisterAdProductPage"));
            print(temp.read("isRegisterProductPage"));
            print(temp.read("argument"));
            print(temp.read("isTop10Page"));
            return ProductMgmtView(isRegisterAdProductPage:temp.read("isRegisterAdProductPage") ,
              isRegisterProductPage:temp.read('isRegisterProductPage') ,argument: temp.read("argument"),
              isTop10Page: temp.read("isTop10Page"),);
          }
      ),
      GoRoute(
          path: PartnerRoutes.ProductInquiryDetailView,
          builder: (context, state) =>state.extra == null ? ProductInquiryListView():
              ProductInquiryDetailView(state.extra as ProductInquiry)
      ),
      GoRoute(
          path: PartnerRoutes.SalesMgmtView,
          builder: (context, state) => SalesMgmtView()
      ),
      GoRoute(
          path: PartnerRoutes.Top10ProductsView,
          builder: (context, state) => Top10ProductsView()
      ),
      GoRoute(
          path: PartnerRoutes.MyPageDownP,
          builder: (context, state) => MyPageDownP()
      ),
      GoRoute(
          path: PartnerRoutes.PaymentView,
          builder: (context, state) => PaymentView()
      ),
      GoRoute(
          path: PartnerRoutes.BusinessEditView,
          builder: (context, state) => BusinessEditView()
      ),
      GoRoute(
          path: PartnerRoutes.AdView,
          builder: (context, state) => AdView(argument: int.parse(state.params["id"]!),)
      ),
      GoRoute(
          path: PartnerRoutes.RegisterCeoEmployeePage4View,
          builder: (context, state) => RegisterCeoEmployeePage4View()
      ),
      GoRoute(
          path: PartnerRoutes.Tab2AdApplicationView,
          builder: (context, state) => Tab2AdApplicationView(argument:int.parse(state.params["id"]!) ,)
      ),
      GoRoute(
          path: PartnerRoutes.User_RegisterPrivacyTermsView,
          builder: (context, state) => state.extra==null ?User_RegisterPrivacyTermsView(): User_RegisterPrivacyTermsView(argument: state.extra as PrivacyOrTerms ,)
      ),
      GoRoute(
          path: PartnerRoutes.AdImpressionView,
          builder: (context, state) => AdImpressionView()
      ),
      GoRoute(
          path: PartnerRoutes.MyBankAccountMgmtView,
          builder: (context, state) => MyBankAccountMgmtView()
      ),
      GoRoute(
          path: PartnerRoutes.PointMgmtView,
          builder: (context, state) => PointMgmtView()
      ),
      GoRoute(
          path: PartnerRoutes.BusinessInfo,
          builder: (context, state) => BusinessInfo()
      ),
      GoRoute(
          path: PartnerRoutes.BusinessView,
          builder: (context, state) => BusinessView()
      ),
      GoRoute(
          path: PartnerRoutes.EmployeeMgmtView,
          builder: (context, state) => EmployeeMgmtView()
      ),
      GoRoute(
          path: PartnerRoutes.ProductInquiryListView,
          builder: (context, state) => ProductInquiryListView()
      ),
      GoRoute(
          path: PartnerRoutes.ReviewListView,
          builder: (context, state) => ReviewListView()
      ),
      GoRoute(
          path: PartnerRoutes.ReviewDetailView,
          builder: (context, state)  {
            if(state.extra==null) return ReviewListView();
            Map<String,dynamic> temp =state.extra as Map<String,dynamic>;

            return ReviewDetailView(selectedReviw: temp["selectedReviw"],
              isComingFromReviewPage: temp["isComingFromReviewPage"],isEditing: temp["isEditing"]??false,);
          }
      ),
      GoRoute(
          path: PartnerRoutes.BulletinListView,
          builder: (context, state) => BulletinListView()
      ),
      GoRoute(
          path: PartnerRoutes.CustomerCenterView,
          builder: (context, state) => CustomerCenterView(isWithdrawPage: state.extra as bool,)
      ),
      GoRoute(
          path: PartnerRoutes.ClothCategoryItemsView,
          builder: (context, state) => ClothCategoryItemsView(state.extra as ClothCategory)
      ),
      GoRoute(
          path: PartnerRoutes.ClothCategoryView,
          builder: (context, state) => ClothCategoryView()
      ),
      GoRoute(
          path: PartnerRoutes.ProductMgmtFilterView,
          builder: (context, state) => ProductMgmtFilterView()
      ),
      GoRoute(
          path: PartnerRoutes.RegisterCeoEmployeePage3View,
          builder: (context, state) => RegisterCeoEmployeePage3View()
      ),
      GoRoute(
          path: PartnerRoutes.RegisterCeoEmployeePage2View,
          builder: (context, state) => RegisterCeoEmployeePage2View()
      ),
      GoRoute(
          path: PartnerRoutes.BusinessRegistrationSubmitView,
          builder: (context, state) => BusinessRegistrationSubmitView(isNewSubmit: state.extra as bool)
      ),
      GoRoute(
          path: PartnerRoutes.ProductDetailView,
          builder: (context, state) => ProductDetailView(productId: int.parse(state.params["id"]!))
      ),
      GoRoute(
          path: PartnerRoutes.User_FindID_FindPasswordView,
          builder: (context, state) => User_FindID_FindPasswordView()
      ),
      GoRoute(
          path: PartnerRoutes.User_SignUpView,
          builder: (context, state) => User_SignUpView()
      ),
      GoRoute(
          path: PartnerRoutes.RegisterCeoEmployeePage1View,
          builder: (context, state) => RegisterCeoEmployeePage1View()
      ),
      GoRoute(
          path: PartnerRoutes.MyInfoMgmtView,
          builder: (context, state) => MyInfoMgmtView()
      ),
      GoRoute(
          path: PartnerRoutes.ChangeNumberView,
          builder: (context, state) => ChangeNumberView()
      ),
    ],
  );
}
