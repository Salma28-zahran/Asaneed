import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/features/profile/presentation/widgets/tag.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfoScreen2 extends StatelessWidget {
  const InfoScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF111814) : const Color(0xFFF9F7F2),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                ////////الكارد الاول ///
                Container(
                  width: 351,
                  height: 440,
                  decoration: BoxDecoration(
                    color: AppColor.getContainerColor(context),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end, 
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset(
                              AssetsManager.icon,
                                color: Color(0xff9CA3AF),
        
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "بيانات الراوي",
                              style: AppColor.textgrey.copyWith(fontSize: 16,color: Color(0xff9CA3AF)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("الاسم الكامل", style: AppColor.textgrey.copyWith(fontSize: 16,color: Color(0xff9CA3AF)),),
                        SizedBox(height: 6,),
                        Text("أبو بكر الصديق",style: GoogleFonts.roboto(color: AppColor.getBlack(context),fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),
                        Text("سنة الوفاة", style: AppColor.textgrey.copyWith(fontSize: 16,color: Color(0xff9CA3AF)),),
                        SizedBox(height: 6,),
                        Text("13 هجرية",style: GoogleFonts.roboto(color: AppColor.getBlack(context),fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),
                        Text("الطبقة", style: AppColor.textgrey.copyWith(fontSize: 16,color: Color(0xff9CA3AF)),),
                        SizedBox(height: 6,),
                        Text("صحابي",style: GoogleFonts.roboto(color: AppColor.getBlack(context),fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),
                        Text("البلد / الإقليم", style: AppColor.textgrey.copyWith(fontSize: 16,color: Color(0xff9CA3AF)),),
                        SizedBox(height: 6,),
                        Text("المدينه",style: GoogleFonts.roboto(color: AppColor.getBlack(context),fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),
                        Text("البلد / الإقليم", style: AppColor.textgrey.copyWith(fontSize: 16,color: Color(0xff9CA3AF)),),
                        SizedBox(height: 9,),
                        tag("ثقة", AppColor.primary2),
        
                      ],
                    ),
                  ),
        
        
                ),
                //////////الكارد التاني /////
                SizedBox(height: 15,),
                Container(
                  width:351 ,
                  height: 110,
                  decoration: BoxDecoration(
                    color: AppColor.getContainerColor(context),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          textDirection: TextDirection.rtl,
                          children: [
                            Icon(Icons.person,color: AppColor.primary,),
                            SizedBox(width: 7,),

                            Text("السيرة الذاتية",style: AppColor.textprimary.copyWith(fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("أول الخلفاء الراشدين، وأفضل البشر بعد الأنبياء.",style: GoogleFonts.scheherazadeNew(color: AppColor.getBlack(context),fontSize: 18),),

                      ],
                    ),
                  ),
        
                ),
                //////////الكارد الثالث /////
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    width:351 ,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColor.getContainerColor(context),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            textDirection: TextDirection.rtl,
                            children: [
                              Image.asset(AssetsManager.icon2,color: AppColor.primary,),

                              SizedBox(width: 7,),

                              Text("الجرح والتعديل",style: AppColor.textprimary.copyWith(fontSize: 16),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Center(
                              child:
                          Container(
                            height: 70,
                            width: 309,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? const Color(0xFF202925)
                                  : const Color(0xFFE2E0D8),



                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(child: Text("لم يتم إضافة أقوال العلماء في هذا الراوي بعد.",style: GoogleFonts.roboto(fontSize: 16,color: AppColor.grey),)),

                          ))

                        ],
                      ),
                    ),

                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
