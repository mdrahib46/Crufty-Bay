
class Urls{
  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";

  static const  String signInUrl = "$_baseUrl/auth/login";
  static String signUpUrl = '$_baseUrl/auth/signup';
  static String otpVerification ="$_baseUrl/auth/verify-otp";
  static String readProfile = '$_baseUrl/ReadProfile';
  static String homeBannerList = '$_baseUrl/ListProductSlider';
  static String categoryList = "$_baseUrl/CategoryList";
  static String productListByRemark(String remark) => "$_baseUrl/ListProductByRemark/$remark";
}