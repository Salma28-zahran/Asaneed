import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const FilterWidget({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Icon(
                Icons.filter_alt_outlined,
                color: AppColor.getBlack(context),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColor.getContainerColor(context),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: " ... إبحث في الرواة  ",
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.scheherazadeNew(
                            color: AppColor.grey,
                            fontSize: 14,
                          ),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Icon(
                      Icons.search_outlined,
                      color: AppColor.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildFilterChip(context, "تابع التابعين"),
              const SizedBox(width: 8),
              _buildFilterChip(context, "تابعي"),
              const SizedBox(width: 8),
              _buildFilterChip(context, "صحابي"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(BuildContext context, String title) {
    final bool isSelected = selectedType == title;

    Color bgColor;
    Color textColor;

    if (!isSelected) {
      bgColor = Colors.grey.shade200;
      textColor = Colors.black87;
    } else {
      switch (title) {
        case "صحابي":
          bgColor = AppColor.green2;
          textColor = AppColor.green;
          break;
        case "تابعي":
          bgColor = AppColor.blue2;
          textColor = AppColor.blue;
          break;
        case "تابع التابعين":
          bgColor = AppColor.orange;
          textColor = AppColor.orange2;
          break;
        default:
          bgColor = Colors.grey.shade200;
          textColor = Colors.black87;
      }
    }

    return InkWell(
      onTap: () {
        onTypeSelected(title);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 290),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: GoogleFonts.scheherazadeNew(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


}
