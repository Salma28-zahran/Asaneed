import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String number;
  final String title;
  final IconData icon;
  final Color iconColor;

  const InfoCard({
    super.key,
    required this.number,
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColor.getContainerColor(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(height: 8),
            Text(
              number,
              style:  GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.getBlack(context),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style:  GoogleFonts.roboto(
                fontSize: 16,
                color: AppColor.getBlack(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
