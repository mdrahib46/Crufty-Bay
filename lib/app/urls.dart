
import 'package:flutter/cupertino.dart';

class Urls{
  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";

  static const  String signInUrl = "$_baseUrl/auth/login";
  static String signUpUrl = '$_baseUrl/auth/signup';
  static String otpVerification ="$_baseUrl/auth/verify-otp";
  static String homeSlideUrl = '$_baseUrl/slides';
  static String categoryList = "$_baseUrl/categories";
  static String productList ="$_baseUrl/products";
  static String wishList = "$_baseUrl/wishlist";

  static String readProfile = '$_baseUrl/ReadProfile';

  static String productListByRemark(String remark) => "$_baseUrl/ListProductByRemark/$remark";
}