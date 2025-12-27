import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/FilterWidget.dart';
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

  String? selectedType;

  final List<Map<String, String>> persons = [
    {"type": "صحابي", "name": "جابر بن عبد الله الأنصاري", "date": "توفي 78 هـ"},
    {"type": "صحابي", "name": "علي بن أبي طالب", "date": "توفي 40 هـ"},
    {"type": "تابعي", "name": "مجاهد بن جبر", "date": "توفي 104 هـ"},
    {"type": "تابعي", "name": "عكرمة", "date": "توفي 105 هـ"},
    {"type": "تابعي", "name": "الحسن البصري", "date": "توفي 110 هـ"},
    {"type": "تابع التابعين", "name": "أبو داود", "date": "توفي 275 هـ"},
    {"type": "تابع التابعين", "name": "النسائي", "date": "توفي 303 هـ"},
    {"type": "تابع التابعين", "name": "الترمذي", "date": "توفي 279 هـ"},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPersons = selectedType == null
        ? persons
        : persons.where((p) => p['type'] == selectedType).toList();

    return Scaffold(
      backgroundColor: context.watch<AppThemeManager>().isDarkMode
          ? Colors.grey[900]
          : Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "الصحابه",
              style: GoogleFonts.tajawal(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          FilterWidget(
            selectedType: selectedType ?? "",
            onTypeSelected: (type) {
              setState(() {
                if (selectedType == type) {
                  selectedType = null;
                } else {
                  selectedType = type;
                }
              });
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredPersons.length,
              itemBuilder: (context, index) {
                final item = filteredPersons[index];
                return buildPersonCard(
                  context: context,
                  type: item["type"]!,
                  name: item["name"]!,
                  date: item["date"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPersonCard({
    required BuildContext context,
    required String type,
    required String name,
    required String date,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRouteName.profile);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColor.getContainerColor(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white10,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getTypeBgColor(type),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        color: _getTypeTextColor(type),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.scheherazadeNew(
                      color: AppColor.getBlack(context),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style:  GoogleFonts.scheherazadeNew(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeBgColor(String type) {
    switch (type) {
      case "صحابي":
        return AppColor.green2;
      case "تابعي":
        return AppColor.blue2;
      case "تابع التابعين":
        return AppColor.orange;
      default:
        return Colors.grey.shade200;
    }
  }

  Color _getTypeTextColor(String type) {
    switch (type) {
      case "صحابي":
        return AppColor.green;
      case "تابعي":
        return AppColor.blue;
      case "تابع التابعين":
        return AppColor.orange2;
      default:
        return Colors.grey;
    }
  }
}
