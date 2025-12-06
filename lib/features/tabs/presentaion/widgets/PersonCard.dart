import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String name;
  final String badgeText;
  final Color badgeColor;
  final int deathYear;
  final VoidCallback? onTap;

  const PersonCard({
    super.key,
    required this.name,
    required this.badgeText,
    required this.badgeColor,
    required this.deathYear,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.05,
        ),
        margin: EdgeInsets.symmetric(vertical: height * 0.01),
        decoration: BoxDecoration(
          color: AppColor.getContainerColor(context),
          borderRadius: BorderRadius.circular(width * 0.045),
          border: Border.all(
            color: AppColor.getborder(context),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Badge
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.005,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                border: Border.all(color: badgeColor, width: 1),
                color: badgeColor.withOpacity(.10),
              ),
              child: Text(
                badgeText,
                style: TextStyle(
                  color: badgeColor,
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            SizedBox(height: height * 0.015),

            // Name
            Text(
              name,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xff1A1A1A),
                fontSize: width * 0.045,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: height * 0.012),

            // Divider
            Container(
              height: 1,
              color: isDark ? Colors.white24 : const Color(0xffE5E5DC),
            ),

            SizedBox(height: height * 0.012),

            // Death Year
            Text(
              "توفي سنة $deathYear",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: isDark ? Colors.white70 : const Color(0xff6B6B6B),
                fontSize: width * 0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
