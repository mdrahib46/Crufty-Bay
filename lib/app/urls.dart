
class Urls{
  static const String _baseUrl = "https://ecommerce-api.codesilicon.com/api";

  static String emailVerification(String userEmail) => "$_baseUrl/UserLogin/$userEmail";
  static String otpVerification(String userEmail, String otp) => "$_baseUrl/VerifyLogin/$userEmail/$otp";
}