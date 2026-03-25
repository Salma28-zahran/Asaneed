import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../../theme/AppThemeManager.dart';
import '../../../../../../../theme/app_theme.dart';

class SahabaFilterBottomSheet extends StatefulWidget {
  const SahabaFilterBottomSheet({super.key});

  @override
  State<SahabaFilterBottomSheet> createState() => _SahabaFilterBottomSheetState();
}

class _SahabaFilterBottomSheetState extends State<SahabaFilterBottomSheet> {
  @override
  void initState() {
    super.initState();

    selectedSort = sortBy.first;
    selectedDegree = sahabaClass.first;
    selectedBook = degreeOfDoc.first;
  }

  List<String> sortBy = [
  "حسب الطبقة",
  "اكثر احاديث",
  "الاقدم وفاة",
  "الاحدث وفاة",
  "الاسم أ→ي",
  "الاسم ي→أ"

  ];

  List<String> sahabaClass = [
    "الكل(45)",
    "النبي(0)",
    "تابعي(19)",
    "صحابي(11)",
    "تابع التابعي (15)",

  ];
  List<String> degreeOfDoc = [
    "الكل(45)",
    "ثقه(43)",
    "صدوق(0)",
    "ضعيف(0)",
    "مجهول (2)",
  ];

  String selectedSort = "";
  String selectedDegree = "";
  String selectedBook = "";

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16),

                child: Row(
                  children: [
                    Text(
                      "فلتر وترتيب",
                      style: GoogleFonts.scheherazadeNew(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColor.getBlack(context),
                      ),
                    ),
                    Spacer(),

                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primary),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Divider(color: AppColor.border),
              Padding(
                padding: EdgeInsets.all(16),

                child: Column(
                  children: [

                    ///eltarteeb 7asb
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "الترتيب حسب", style: GoogleFonts.scheherazadeNew(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                      sortBy.map((filterComponent) {
                        bool isSelected = selectedSort == filterComponent;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSort = filterComponent;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color:
                              isSelected
                                  ? AppColor.primary
                                  : isDark ? Color(0xFF1F2A26) : Color(
                                  0xFFE7E5E1),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: isDark ? Color(0xFF2E3A35) : Color(
                                    0xFFBDB8B0),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              filterComponent,
                              style: GoogleFonts.scheherazadeNew(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,

                                color:
                                isSelected
                                    ? Colors.white
                                    : AppColor.getBlack(context),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("الطبقة", style: GoogleFonts.scheherazadeNew(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                      sahabaClass.map((filterComponent) {
                        bool isSelected = selectedDegree == filterComponent;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDegree = filterComponent;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color:
                              isSelected
                                  ? AppColor.primary
                                  : isDark ? Color(0xFF1F2A26) : Color(
                                  0xFFE7E5E1),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: isDark ? Color(0xFF2E3A35) : Color(
                                    0xFFBDB8B0),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              filterComponent,
                              style: GoogleFonts.scheherazadeNew(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,

                                color:
                                isSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("درجة التوثيق", style: GoogleFonts.scheherazadeNew(
                          color: AppColor.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                      degreeOfDoc.map((filterComponent) {
                        bool isSelected = selectedBook == filterComponent;


                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBook = filterComponent;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color:
                              isSelected
                                  ? AppColor.primary
                                  : isDark ? Color(0xFF1F2A26) : Color(
                                  0xFFE7E5E1),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: isDark ? Color(0xFF2E3A35) : Color(
                                    0xFFBDB8B0),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              filterComponent,
                              style: GoogleFonts.scheherazadeNew(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color:
                                isSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedSort = sortBy.first;
                                selectedDegree = sahabaClass.first;
                                selectedBook = degreeOfDoc.first;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              side: BorderSide(
                                color: AppColor.border,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              "إعادة ضبط",
                              style: GoogleFonts.scheherazadeNew(
                                color: AppColor.getBlack(context),
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, {
                                "sort": selectedSort,
                                "degree": selectedDegree,
                                "book": selectedBook,
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff2F5D50),
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "تم",
                              style: GoogleFonts.scheherazadeNew(
                                color: AppColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
