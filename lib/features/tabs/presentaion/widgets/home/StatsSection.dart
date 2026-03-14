import 'package:flutter/material.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: FourCard(
                number: "100",
                label: "حديث",
                icon: Icons.menu_book_outlined,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: FourCard(
                number: "22",
                label: "كتاب",
                icon: Icons.book_outlined,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FourCard(
                number: "5",
                label: "سند",
                icon: Icons.timeline_outlined,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: FourCard(
                number: "45",
                label: "راوي",
                icon: Icons.people_outline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FourCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const FourCard({
    super.key,
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.getContainerColor(context),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColor.getborder(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColor.getBlack(context),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff6B7280),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.getPrimary6(context),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 26,
              color: const Color(0xff2F5D50),
            ),
          ),
        ],
      ),
    );
  }
}