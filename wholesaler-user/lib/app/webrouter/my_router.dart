import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wholesaler_partner/app/models/product_inquiry_model.dart';
import 'package:wholesaler_partner/app/modules/change_number/view/change_number_view.dart';
import 'package:wholesaler_partner/app/modules/main/view/partner_main_view.dart';
import 'package:wholesaler_partner/app/modules/product_inquiry_detail/view/product_inquiry_detail_view.dart';
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
import 'package:wholesaler_user/app/modules/search/views/search_page_view.dart';
import 'package:wholesaler_user/app/modules/splash_screen/view/splash_screen_view.dart';

class MyRoutes {
  static const USERMAINVIEW = '/';
  static const USERLOGIN = '/login';
  static const ProductDetailView = '/product/:id';
  static const ProductInquiryDetailView = '/productinquiry';
  static const ReviewDetailView = '/reviewdetail';
  static const ExhibitionProductsView = '/productexhibition/:id';
  static const StoreDetailView = "/store/:id";
  static const SearchPageView = "/search";
  static const Cart1ShoppingBasketView = "/cart1shoppingbasket";
  static const User_SignUpView = "/signup";
  static const ChangeNumberView= "/changenumber";
  static const MyPageUpdatePasswordView = "/mypagepassword";
  static const User_RegisterPrivacyTermsView = "/userregisterprivacy";
  static const OrderInquiryAndReviewView = "/orderinquiryreview";
  static const PointMgmtView = "/pointmgmt";
  static const Page4FavoriteProductsView = "/page4favorite";
  static const InquiriesPageView = "/inquiries";
  static const FaqView = "/faq";
  static const BulletinListView = "/bullet";
  static const CompanyIntroPageView = "/companyinfo";
  static const MyPageSettingsView = "/mypage/settings";
  static const Tab4DingDongView = "/tab4ddingdong";
  static const OrderDetailsView = "/order/:id";
  static const BulletinDetailView = "/bulletdetail";
  static const User_FindID_FindPasswordView = "/findinfo";
  static const Cart2PaymentView = "/cart2payment";
  static const Payment = "/payment";
  static const MYPAGEDOWN = "/mypagedown";
  static const ProductCategoryPageView = "/product/category/:id";


}
class FuckingTest{}
class UserPages {
  static late final userRouter = GoRouter(
    redirect: (context,state) {
      if (CacheProvider().getToken().isEmpty&&state.subloc!="/signup"&&state.subloc!="/findinfo") {
          return "/login";
      }
      if(state.subloc=="/login"&&CacheProvider().getToken().isNotEmpty){
        return "/";
      }
      // if(state.subloc=="/") {
      //   bool isLogin =  CacheProvider().getToken().isNotEmpty;
      //   if(isLogin) return "/";
      //   else return "/login";
      // }
    },
    errorBuilder: (context, state) => Container(child: Text("dd"),),
    routes: [
      GoRoute(
          path: MyRoutes.USERMAINVIEW,
          builder: (context, state) => UserMainView()
      ),
      GoRoute(
          path: MyRoutes.MYPAGEDOWN,
          builder: (context, state) => MyPageDown()
      ),
      GoRoute(
          path: MyRoutes.USERLOGIN,
          builder: (context, state) => User_LoginPageView()
      ),
      GoRoute(
          path: MyRoutes.ProductDetailView,
          builder: (context, state) => ProductDetailView(productId: int.parse(state.params["id"]!),)
      ),
      GoRoute(
          path: MyRoutes.ProductCategoryPageView,
          builder: (context, state) => ProductCategoryPageView(int.parse(state.params["id"]!),)
      ),
      GoRoute(
          path: MyRoutes.ProductInquiryDetailView,
          builder: (context, state) =>
            ProductInquiryDetailView(state.extra as ProductInquiry)
          ),
      GoRoute(
          path: MyRoutes.ReviewDetailView,
          builder: (context, state)  {
            Map<String,dynamic> temp =state.extra as Map<String,dynamic>;

            return ReviewDetailView(selectedReviw: temp["selectedReviw"],
                isComingFromReviewPage: temp["isComingFromReviewPage"],isEditing: temp["isEditing"],);
          }
      ),
      GoRoute(
          path: MyRoutes.ExhibitionProductsView,
          builder: (context, state) => ExhibitionProductsView(int.parse(state.params["id"]!))
      ),
      GoRoute(
          path: MyRoutes.StoreDetailView,
          builder: (context, state) => StoreDetailView(storeId: int.parse(state.params["id"]!),prevPage: state.extra as String,)
      ),
      GoRoute(
          path: MyRoutes.SearchPageView,
          builder: (context, state) => SearchPageView()
      ),
      GoRoute(
          path: MyRoutes.Cart1ShoppingBasketView,
          builder: (context, state) => Cart1ShoppingBasketView()
      ),
      GoRoute(
          path: MyRoutes.User_SignUpView,
          builder: (context, state) => User_SignUpView()
      ),
      GoRoute(
          path: MyRoutes.ChangeNumberView,
          builder: (context, state) => ChangeNumberView()
      ),
      GoRoute(
          path: MyRoutes.MyPageUpdatePasswordView,
          builder: (context, state) => MyPageUpdatePasswordView()
      ),
      GoRoute(
          path: MyRoutes.User_RegisterPrivacyTermsView,
          builder: (context, state) => User_RegisterPrivacyTermsView(argument: state.extra as PrivacyOrTerms,)
      ),
      GoRoute(
          path: MyRoutes.OrderInquiryAndReviewView,
          builder: (context, state)  {
            Map<String,dynamic> temp = state.extra as Map<String,dynamic>;
            print("=-=-=--=-=-=-=-===-=-===-=-=-$temp");
            return OrderInquiryAndReviewView(hasHomeButton: false,isBackEnable: false, argument: temp["argument"],);
          }
      ),
      GoRoute(
          path: MyRoutes.PointMgmtView,
          builder: (context, state) => PointMgmtView()
      ),
      GoRoute(
          path: MyRoutes.Page4FavoriteProductsView,
          builder: (context, state) {
            Map<String,dynamic> temp = state.extra as Map<String,dynamic>;
            return Page4FavoriteProductsView(isRecentSeenProduct: temp["isRecentSeenProduct"]);
          }
      ),
      GoRoute(
          path: MyRoutes.InquiriesPageView,
          builder: (context, state) => InquiriesPageView()
      ),
      GoRoute(
          path: MyRoutes.FaqView,
          builder: (context, state) => FaqView()
      ),
      GoRoute(
          path: MyRoutes.BulletinListView,
          builder: (context, state) => BulletinListView()
      ),
      GoRoute(
          path: MyRoutes.CompanyIntroPageView,
          builder: (context, state) => CompanyIntroPageView()
      ),
      GoRoute(
          path: MyRoutes.MyPageSettingsView,
          builder: (context, state) => MyPageSettingsView()
      ),
      GoRoute(
          path: MyRoutes.Tab4DingDongView,
          builder: (context, state) => Tab4DingDongView()
      ),
      GoRoute(
          path: MyRoutes.OrderDetailsView,
          builder: (context, state) => OrderDetailsView(orderId: int.parse(state.params["id"]!))
      ),
      GoRoute(
          path: MyRoutes.BulletinDetailView,
          builder: (context, state) {
            Map<dynamic,dynamic> temp = state.extra as Map<dynamic,dynamic>;

            return BulletinDetailView(bulletinModel: temp["bulletinModel"], userType: temp["userType"]);
          }
      ),
      GoRoute(
          path: MyRoutes.User_FindID_FindPasswordView,
          builder: (context, state) => User_FindID_FindPasswordView()
      ),
      GoRoute(
          path: MyRoutes.Cart2PaymentView,
          builder: (context, state) {
           // Map<dynamic,dynamic> temp = state.extra as Map<dynamic,dynamic>;

            return Cart2PaymentView(state.extra as Cart2CheckoutModel);
          }
      ),
      GoRoute(
          path: MyRoutes.Payment,
          builder: (context, state) => Payment()
      )

      // GoRoute(
      //   path: MyRoutes.DETAIL,
      //   name: "/detail",
      //   builder: (context, state) {
      //     return DetailPage(param: state.params['id'],index: state.params["index"],);},
      // ),
      // GoRoute(
      //     path: MyRoutes.UPDATE,
      //     name: "/update",
      //     builder: (context, state) => UpdatePage(param:state.params['id'],index: state.params['index'],)
      // ),
      // GoRoute(
      //     path: MyRoutes.TEST4,
      //     builder: (context, state) => Test4()
      // ),
    ],
  );
}