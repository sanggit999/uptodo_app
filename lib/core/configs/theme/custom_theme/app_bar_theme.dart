import 'package:flutter/material.dart';

class AppAppBarTheme {
  static const AppBarTheme appBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,// Loại bỏ hiệu ứng khi cuộn ví dụ SingleChildScrollView,....
    centerTitle: true,
  );
}
