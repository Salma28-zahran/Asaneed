import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/theme/app_theme.dart';

class BookTopCard extends StatelessWidget {
  const BookTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.getContainerColor(context),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // اسم الكتاب + أيقونات
          Row(
            children: [
              Text(
                "التقريب والتيسير",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.getBlack(context),
                ),
              ),
              const Spacer(),
              Icon(Icons.share_outlined, color: Colors.grey[500]),
              const SizedBox(width: 12),
              Icon(Icons.copy_outlined, color: Colors.grey[500]),
            ],
          ),

          const SizedBox(height: 12),

          // معلومات سريعة (Tags)
          Row(
            children: [
              _infoItem(Icons.verified_outlined, "محقق"),
              const SizedBox(width: 16),
              _infoItem(Icons.sell_outlined, "أصول الحديث"),
              const SizedBox(width: 16),
              _infoItem(Icons.person_outline, "النووي"),
            ],
          ),

          const SizedBox(height: 16),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 12),

          // أزرار الأكشن
          Row(
            children: [
              _actionButton(
                icon: Icons.menu_book_outlined,
                text: "قراءة",
                isSelected: true,
              ),
              _actionButton(
                icon: Icons.list_outlined,
                text: "الفهرس",
              ),
              _actionButton(icon: Icons.bookmark_border, text: "حفظ"),
              _actionButton(
                icon: Icons.download_outlined,
                text: "تحميل",
              ),
            ],
          ),
        ],
      ),
    );
  }

  // -------- Widgets داخل الهيدر --------

  Widget _infoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[700]),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String text,
    bool isSelected = false,
  }) {
    return Expanded(
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : const Color(0xFFEAE7E2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            const SizedBox(height: 6),
            Text(
              text,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}