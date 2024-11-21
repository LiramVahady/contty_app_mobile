import 'package:flutter/material.dart';

class ConstantColor {
  static final clear = Colors.white.withOpacity(0);
  static const PRIMARY_BG_COLOR = Color(0xFF191B23);
  static const SECONDARY_BF_COLOR = Color(0xff1C1C1E);
}

class HTTPEntPoint {
  static const register = "auth/register";
  static const currentUser = "auth/currentUser";
  static const userInfo = "userInfo";
  static const userInfoById = "userInfo/?userId={id}";
  static const userAgreement = "configuration/userAgreement";
  static const login = "auth/login";
  static const buissinesCategories = "BusinessCategory";
  static const ideas = "generate/ideas";
  static const createPost = "generate/posts?ideaId={id}";
  static const createImage = "generate/images?postId={id}";
}
