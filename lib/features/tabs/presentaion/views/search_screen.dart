import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/AppThemeManager.dart';
import '../../../../theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedTab = 0;
  bool showFilterBox = false;

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF111814) : AppColor.white,

      ///AppBar///
      appBar: AppBar(
        backgroundColor: isDark ? AppColor.black : Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "بحث",
            style: TextStyle(
              color: isDark ? AppColor.white : AppColor.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: GestureDetector(
            onTap: () {
              themeManager.toggleTheme();
            },
            child: Icon(
              isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
              size: 24,
              color: isDark ? Colors.grey[700] : AppColor.primary,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///search types///
              Center(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: isDark ? AppColor.primary5 : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isDark ? AppColor.grey2 : Colors.transparent,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      searchTypes(0, "بحث بالنص"),
                      SizedBox(width: 20),
                      searchTypes(1, "بحث بالراوي"),
                      SizedBox(width: 20),
                      searchTypes(2, "بحث بالمصدر"),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              ///search field and filterBox///
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showFilterBox = !showFilterBox;
                        });
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: isDark ? AppColor.primary5 : Colors.white,
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            color: isDark ? AppColor.grey2 : Colors.transparent,
                            width: 1.5,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              spreadRadius: 1,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.tune,
                          color:
                              showFilterBox
                                  ? Color(0xff4A8B71)
                                  : (isDark ? AppColor.white : AppColor.black),
                          size: 20,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: isDark ? AppColor.primary5 : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: isDark ? AppColor.grey2 : Colors.transparent,
                          width: 1.5,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          // Search Icon
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.search,
                              color: isDark ? AppColor.grey3 : Colors.black54,
                              size: 23,
                            ),
                          ),

                          // TextField
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "...ابحث في الأحاديث أو الرواة",
                                hintStyle: TextStyle(
                                  color:
                                      isDark ? AppColor.white : AppColor.black,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          // Filter Icon
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              ///filter section///
              if (showFilterBox)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? AppColor.primary5 : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + Icon Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "تحسين البحث",
                              style: TextStyle(
                                color: isDark ? AppColor.white : AppColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Color(0xff4A8B71),
                              size: 22,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        // Divider
                        Divider(
                          color: isDark ? AppColor.grey2 : AppColor.grey,
                          thickness: 1.7,
                        ),

                        SizedBox(height: 14),

                        // Label: GRADE
                        Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: Text(
                            "درجة",
                            style: TextStyle(
                              color: AppColor.grey3,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        SizedBox(height: 8),

                        // Dropdown
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: isDark ? AppColor.primary5 : AppColor.grey3,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1.7,
                              color:
                                  isDark ? AppColor.grey2 : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: isDark ? AppColor.grey2 : AppColor.white,
                                size: 30,
                              ),
                              Text(
                                "جميع الدرجات",
                                style: TextStyle(
                                  color:
                                      isDark ? AppColor.white : AppColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 15),

              Divider(
                color: isDark ? AppColor.grey2 : AppColor.grey,
                thickness: 1.4,
              ),

              ///search icon with search description ///
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isDark
                          ? Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColor.primary5,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Icon(
                              Icons.search,
                              size: 80,
                              color: Color(0xff9CA3AF),
                            ),
                          )
                          : Icon(
                            Icons.search,
                            size: 80,
                            color: Color(0xff9CA3AF),
                          ),

                      SizedBox(height: 16),
                      Text(
                        "ابدأ بالبحث",
                        style: TextStyle(
                          color: isDark ? AppColor.white : AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "البحث عن الأحاديث عن طريق الكلمات الرئيسية باللغة\n العربية أو الإنجليزية.",
                        style: TextStyle(
                          color: AppColor.grey3,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///search widget///
  Widget searchTypes(int index, String text) {
    final bool isSelected = selectedTab == index;
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? isDark
                      ? AppColor.black
                      : AppColor.primary
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? AppColor.grey2 : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                isSelected
                    ? Colors.white
                    : isDark
                    ? Color(0xff9CA3AF)
                    : AppColor.black,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
