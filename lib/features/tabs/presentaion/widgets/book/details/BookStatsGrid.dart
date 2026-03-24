import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaneed/theme/app_theme.dart';

class BookStatsGrid extends StatelessWidget {
  const BookStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: const [
        StatsCard(icon: Icons.description, number: "160", label: "صفحة"),
        StatsCard(icon: Icons.layers, number: "1", label: "أجزاء"),
        StatsCard(icon: Icons.storage, number: "640 KB", label: "الحجم"),
        StatsCard(icon: Icons.calendar_today, number: "20 شعبان 1447 هـ", label: "أضيف"),
      ],
    );
  }
}

// --------- الكارت نفسه ---------

class StatsCard extends StatelessWidget {
  final IconData icon;
  final String number;
  final String label;

  const StatsCard({
    super.key,
    required this.icon,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.getContainerColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.getborder(context)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(height: 6),
          Text(
            number,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.getBlack(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.getBlack(context),
            ),
          ),
        ],
      ),
    );
  }
}