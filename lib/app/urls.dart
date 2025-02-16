
class Urls{
  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";

  static const  String signInUrl = "$_baseUrl/auth/login";
  static String otpVerification(String userEmail, String otp) => "$_baseUrl/VerifyLogin/$userEmail/$otp";
  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String homeBannerList = '$_baseUrl/ListProductSlider';
  static String categoryList = "$_baseUrl/CategoryList";
  static String productListByRemark(String remark) => "$_baseUrl/ListProductByRemark/$remark";
}