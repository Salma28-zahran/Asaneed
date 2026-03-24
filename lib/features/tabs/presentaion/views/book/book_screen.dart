import 'package:asaneed/features/tabs/presentaion/widgets/book/book_card.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<String> categories = [
    "الكل",
    "علوم الحديث",
    "أصول الحديث",
    "السير والتراجم",
    "مجميع الحديث",
    "دراسات الرواة",
    "الفقه",
    "التفسير",
    "العقيدة",
  ];

  String selectedTab = "الكل";

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: height * 0.015),

            /// search + filter
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.filter_list),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Container(
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: AppColor.getContainerColor(context),
                        borderRadius: BorderRadius.circular(30),
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
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.015),

            /// tabs
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: height * 0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final tab = categories[index];
                    final isSelected = selectedTab == tab;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = tab;
                        });
                      },
                      child: Container(
                        margin:
                        const EdgeInsets.symmetric(horizontal: 6),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xff2F5D4E)
                              : const Color(0xffEDEAE6),
                          borderRadius:
                          BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          tab,
                          style: GoogleFonts.inter(
                            fontSize: width * 0.035,
                            color: isSelected
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "قائمة الكتب",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// books list
            ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const BookCard();
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}