import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../theme/app_theme.dart';
class OptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool isLogout;

  const OptionItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding:  EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [

            Icon(
              icon,
              size: 27,
              color: isLogout ? Colors.red : AppColor.grey3,
            ),

             SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.getBlack(context),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16,
                        color: AppColor.grey,
                      ),
                    ),
                  ]
                ],
              ),
            ),

            if (!isLogout)
              const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}