import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final bool showEye;
  final VoidCallback? onEyeTap;

  const BuildTextField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.controller,
    this.showEye = false,
    this.onEyeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xffE2E0D8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.ibmPlexSansArabic(
            color: const Color(0xff9CA3AF),
            fontSize: 15,
          ),
          prefixIcon: showEye
              ? GestureDetector(
            onTap: onEyeTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.visibility_outlined,
                size: 22,
                color: Color(0xff6B7280),
              ),
            ),
          )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}