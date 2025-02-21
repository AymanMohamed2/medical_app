import 'package:medical_app/core/constants/api_constance.dart';

abstract class ApiUrls {
  static String loginUrl =
      '${ApiConstance.appwriteBaseUrl}account/sessions/phone';
  static String apiLoginUrl = '${ApiConstance.apiBaseUrl}register-user/';
  static String editUserUrl = '${ApiConstance.apiBaseUrl}users/';

  static String getHomeCategoriesUrl =
      '${ApiConstance.apiBaseUrl}shop-categories/';
  static String getOffers = '${ApiConstance.apiBaseUrl}offers/';
  static String getCategoryShopsUrl = '${ApiConstance.apiBaseUrl}shops/';
  static String getShopProductsUrl = '${ApiConstance.apiBaseUrl}products/';
  static String getShopCategoriesUrl =
      '${ApiConstance.apiBaseUrl}product-categories/';
  static String addToCartUrl = '${ApiConstance.apiBaseUrl}cart/add/';
  static String fetchCartUrl = '${ApiConstance.apiBaseUrl}user/cart/';
  static String editProductQuantity = '${ApiConstance.apiBaseUrl}order/items';

  static String createOrderUrl = '${ApiConstance.apiBaseUrl}order/place/';
  static String fetchOrders = '${ApiConstance.apiBaseUrl}orders/';
  static String deleteOrderUrl = '${ApiConstance.apiBaseUrl}orders/';
}
