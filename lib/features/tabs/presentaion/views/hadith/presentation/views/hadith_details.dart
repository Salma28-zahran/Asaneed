import 'package:asaneed/features/tabs/presentaion/views/Account/widgets/custom_app_bar_account.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HadithDetails extends StatelessWidget {
  final int number;
  final String status;

  const HadithDetails({super.key, required this.number, required this.status});

  @override
  Widget build(BuildContext context) {
    Color _statusColor(String status) {
      switch (status) {
        case "صحيح":
          return Colors.green;
        case "حسن":
          return Colors.amber;
        case "ضعيف":
          return Colors.red;
        default:
          return Colors.grey;
      }
    }
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: CustomAppBarAccount(title: "تفاصيل الحديث"),
      body: Padding(
        padding: EdgeInsets.all(16),

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.getContainerColor(context),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.border, width: 1.5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: _statusColor(status).withOpacity(.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              status,
                              style: GoogleFonts.scheherazadeNew(
                                color: _statusColor(status),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "# $number • علوم الحديث الموقوف والمقطوع",
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,

                              style: GoogleFonts.scheherazadeNew(
                                fontSize: 16,
                                color: AppColor.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

                      /// النص
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى.",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.scheherazadeNew(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

                      Row(
                        children: [
                          Icon(
                            Icons.person_outlined,
                            color: AppColor.grey,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "عمر بن الخطاب",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.scheherazadeNew(
                                color: AppColor.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      Divider(color: AppColor.border),
                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _actionButton(
                            icon: Icons.bookmark_border,
                            label: "حفظ",
                            isDark: isDark,
                          ),
                          _actionButton(icon: Icons.copy,
                            label: "نسخ",
                            isDark: isDark,),

                          _actionButton(icon: Icons.share,
                            label: "مشاركة",
                            isDark: isDark,),

                          _actionButton(
                            icon: Icons.book,
                            label: "قراءة",
                            selectedBgColor: AppColor.primary,
                            selectedColor: Colors.white,
                            isDark: isDark,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.getContainerColor(context),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      /// العنوان
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 18,
                            color: AppColor.grey,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              "الشرح العلمي",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.scheherazadeNew(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColor.getBlack(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              "يُرسي هذا الحديث مبدأً أساسياً مفاده أن النيّات هي التي تُحدّد القيمة الأخلاقية للأفعال.",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.scheherazadeNew(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColor.getBlack(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      Divider(color: AppColor.border),
                      Text(
                        "يضع علماء الحديث هذه الرواية في مقدمة مصنفاتهم لأنها تجمع روح العمل الإسلامي. واعتبرها النووي واحدة من المحاور التي يدور عليها الفقه الإسلامي. "
                            "والسند موثوق: الراوي الأول صحابي تُقبل روايته بإجماع العلماء.",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.scheherazadeNew(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.grey,
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColor.primary.withOpacity(0.2)
                                : Color(0xffE8F0EC),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("الحكم الفقهي", textAlign: TextAlign.right,
                                style: GoogleFonts.scheherazadeNew(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColor.primary,
                                ),),
                              SizedBox(height: 5,),
                              Text(
                                "العبادات تشترط النية الواعية، والأفعال التي تؤدى دون نية تعتبر ناقصة من الناحية الشرعية.",
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 14,
                                  color: AppColor.getBlack(context),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          )
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(children: [
                  Text('الرواة بنظرة',textAlign: TextAlign.right,style: GoogleFonts.scheherazadeNew(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.grey,
                  ) ,)
                ], ),
                  SizedBox(height: 16,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      spacing: 8,
                    children: [
                      _rawiChip(
                          "عمر بن الخطاب", 1, Color(0xffE8F5E9), Colors.green),
                      _rawiChip(
                          "ابن شهاب الزهري", 2, Color(0xffE3F2FD), Colors.blue),
                      _rawiChip(
                          "مالك بن أنس", 3, Color(0xffFFF3E0), Colors.orange),
                    ],
                                    ),
                  ),

                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.getContainerColor(context),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.border, width: 1.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.menu_book_outlined, size: 18,
                              color: AppColor.grey),
                          SizedBox(width: 6),
                          Text(
                            "المصدر",
                            style: GoogleFonts.scheherazadeNew(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColor.getBlack(context),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColor.border),
                        ),
                        child:Column(
                          children: [
                            Row(
                              children: [

                                Expanded(
                                  child: Text(
                                    "علوم الحديث الموقوف والمقطوع",
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 18,
                                      color: AppColor.getBlack(context),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16,
                                    color: AppColor.grey),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [

                                Text(
                                    "حديث # $number .",

                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.scheherazadeNew(
                                    fontSize: 16,
                                    color: AppColor.grey,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  status,
                                  style: GoogleFonts.scheherazadeNew(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.grey,

                                  ),
                                ),
                              ],
                            ),


                          ],
                        )


                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required bool isDark,
    Color? selectedBgColor,
    Color? selectedColor,
  }) {
    Color defaultBg = isDark ? const Color(0x1AF1F1F1) : AppColor.border;
    Color defaultText = isDark ? AppColor.white : AppColor.black;

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selectedBgColor ?? defaultBg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, color: selectedColor ?? defaultText),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selectedColor ?? defaultText,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rawiChip(String name, int number, Color bg, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$number",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4),
          Text(
            name,
            style: TextStyle(
              color: color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
