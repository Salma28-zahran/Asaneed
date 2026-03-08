import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/ItemRow.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AsaneedScreen extends StatelessWidget {
  final Function(int)? onTabChange;

  const AsaneedScreen({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final width = mq.size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: width * 0.97,
                padding: EdgeInsets.all(width * 0.02),
                decoration: BoxDecoration(
                  color: AppColor.getContainerColor(context),
                  borderRadius: BorderRadius.circular(width * 0.04),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ItemRow(
                      icon: Icons.circle,
                      title: 'الدائرة الإسنادية',
                      description: 'استعرض الأسانيد في دائرة واحدة.',
                      iconBackground: const Color(0xFFE3F2E3),
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.circle1);
                      },
                    ),
                    const SizedBox(height: 12),
                    ItemRow(
                      icon: Icons.account_tree_outlined,
                      title: 'شجرة الإسنادية',
                      description: 'اطلع على تسلسل الإسناد من الصحابي للراوي.',
                      iconBackground: const Color(0xFFFFF4E5),
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.tree);
                      },
                    ),
                    const SizedBox(height: 12),
                    ItemRow(
                      icon: Icons.credit_card_rounded,
                      title: 'البطاقات الإسنادية',
                      description: 'عرض معلومات كل راوٍ بطريقة مختصرة.',
                      iconBackground: const Color(0xFFE7E9FF),
                      onTap: () {
                        onTabChange?.call(1);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}