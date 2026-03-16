import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String selectedSort = "الأحدث أولاً";
  String selectedCategory = "كل التصنيفات";

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.015),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showFilterSheet(context);
                  },
                  child: Container(
                    height: height * 0.06,
                    width: 80,
                    child: Icon(Icons.filter_list),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Container(
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      color: AppColor.getContainerColor(context),
                      borderRadius: BorderRadius.circular(width * 0.075),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: " ...ابحث عن كتاب، مؤلف",
                        hintStyle: GoogleFonts.inter(
                          color: const Color(0xFF6B7280),
                          fontSize: width * 0.04,
                        ),
                        contentPadding: EdgeInsets.only(
                          right: width * 0.015,
                          left: width * 0.03,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 0.025),
                          child: Icon(
                            Icons.search,
                            color: const Color(0xFF6A6A80),
                            size: width * 0.055,
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          minWidth: width * 0.08,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.getContainerColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// الخط الصغير فوق
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      /// العنوان
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "فلتر وترتيب",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.close),
                        ],
                      ),
                      const Divider(height: 30),

                      /// الترتيب
                      const Text(
                        "الترتيب حسب",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          filterChip("الأحدث أولاً", setModalState),
                          filterChip("الأقدم أولاً", setModalState),
                          filterChip("العنوان أ → ي", setModalState),
                          filterChip("العنوان ي → أ", setModalState),
                          filterChip("المؤلف أ → ي", setModalState),
                          filterChip("الأطول أولاً", setModalState),
                          filterChip("الأقصر أولاً", setModalState),
                        ],
                      ),
                      const SizedBox(height: 25),

                      /// التصنيف
                      const Text(
                        "التصنيف",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          categoryChip("كل التصنيفات", setModalState),
                          categoryChip("علوم الحديث", setModalState),
                          categoryChip("أصول الحديث", setModalState),
                          categoryChip("السير والتراجم", setModalState),
                          categoryChip("مجمع الحديث", setModalState),
                          categoryChip("دراسات الرواة", setModalState),
                          categoryChip("الفقه", setModalState),
                          categoryChip("التفسير", setModalState),
                          categoryChip("العقيدة", setModalState),
                        ],
                      ),
                      const Spacer(),

                      /// الأزرار
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff2F5D4E),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Center(
                                child: Text(
                                  "تم",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColor.getContainerColor(context),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Center(
                                child: Text(
                                  "إعادة ضبط",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget filterChip(String title, StateSetter setModalState) {
    bool isSelected = selectedSort == title;
    return GestureDetector(
      onTap: () {
        setModalState(() {
          selectedSort = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff2F5D4E) : const Color(0xffEDEAE6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget categoryChip(String title, StateSetter setModalState) {
    bool isSelected = selectedCategory == title;
    return GestureDetector(
      onTap: () {
        setModalState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff2F5D4E) : const Color(0xffEDEAE6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}