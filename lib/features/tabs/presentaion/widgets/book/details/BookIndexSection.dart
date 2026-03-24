import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaneed/theme/app_theme.dart';

class BookIndexSection extends StatelessWidget {
  const BookIndexSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.getContainerColor(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.getborder(context)),
      ),
      child: Column(
        children: const [
          // عنوان الفهرس
          IndexHeader(),
          SizedBox(height: 10),

          // عناصر الفهرس
          IndexItem(title: "المقدمة"),
          CustomDivider(),
          IndexItem(title: "الباب الأول: المضامين الأساسية"),
          CustomDivider(),
          IndexItem(title: "الباب الثاني: الدراسة التفصيلية"),
          CustomDivider(),
          IndexItem(title: "الخاتمة والفهارس"),
        ],
      ),
    );
  }
}


class IndexHeader extends StatelessWidget {
  const IndexHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.list_alt, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 6),
        Text(
          "الفهرس",
          style: GoogleFonts.scheherazadeNew(fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 15),
        Text(
          "عرض الفهرس",
          style: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class IndexItem extends StatelessWidget {
  final String title;

  const IndexItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.grey3,
            size: 16,
          ),
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