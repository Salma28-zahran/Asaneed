import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tag(String text, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color.withOpacity(0.15),
    ),
    child: Text(
      text,
      style: GoogleFonts.tajawal(
        color: color,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
