import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<AppThemeManager>().isDarkMode
          ? Colors.grey[900]
          : Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        title: Text(
          "الصحابه",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 110 / 100,
              ),
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return buildSahabiCard(
                  context: context,
                  index: index,
                  isSelected: selectedIndex == index,
                  type: "صحابي",
                  name: "جابر بن عبد الله الأنصاري",
                  date: "تاريخ الوفاة 78 هجريه",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSahabiCard({
    required BuildContext context,
    required int index,
    required bool isSelected,
    required String type,
    required String name,
    required String date,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        Navigator.pushNamed(context, PageRouteName.rwah);



      },
      child: Card(
        elevation: 3,
        color: isSelected ? AppColor.primary : AppColor.getWhite(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [

            Container(
              width: 24,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : AppColor.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.chevron_left,
                  color: isSelected ? AppColor.primary : AppColor.white,
                  size: 20,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white24
                            : AppColor.purple,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          color: isSelected ? AppColor.white : AppColor.purple2,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : AppColor.getBlack(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected ? Colors.white70 : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
