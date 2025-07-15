import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features.dart';

class GrannyCollection {
  static final List<HighlightedItem> items = [
    HighlightedItem(
      offset: Offset(60.w, 395.h),
      size: Size(83.r, 88.r),
      asset: 'assets/png/flower_shadow.png',
    ),
    HighlightedItem(
      offset: Offset(160.w, 463.h),
      size: Size(68.r, 39.r),
      asset: 'assets/png/books_shadow.png',
    ),
    HighlightedItem(
      offset: Offset(283.w, 483.h),
      size: Size(62.r, 53.r),
      asset: 'assets/png/needle_shadow.png',
    ),
    HighlightedItem(
      offset: Offset(19.w, 553.h),
      size: Size(85.r, 42.r),
      asset: 'assets/png/shoes_shadow.png',
    ),
  ];
}
