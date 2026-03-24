import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaneed/theme/app_theme.dart';

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.getContainerColor(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          // عنوان القسم
          Row(
            children: [
              Text(
                "معلومات الكتاب",
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // صفوف المعلومات
          InfoRowWithIcon(icon: Icons.article_outlined, title: "الناشر", value: "ناشر تجريبي"),
          const CustomDivider(),
          InfoRowWithIcon(icon: Icons.edit_outlined, title: "المحقق", value: "محقق تجريبي"),
          const CustomDivider(),
          InfoRowWithIcon(icon: Icons.layers_outlined, title: "الطبعة", value: "1st"),
        ],
      ),
    );
  }
}

// -------- Widgets صغيرة --------

class InfoRowWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoRowWithIcon({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Text(title, style: TextStyle(color: Colors.grey[700])),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.grey.shade300, height: 1);
  }
}