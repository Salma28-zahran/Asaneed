import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/data/BookDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:asaneed/theme/app_theme.dart';

class BookTopCard extends StatelessWidget {
  final BookDetailsModel book;

  const BookTopCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColor.getContainerColor(context),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          /// اسم الكتاب + أيقونات
          Row(
            children: [

              Expanded(
                child: Text(
                  book.title ?? '',

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.getBlack(context),
                  ),
                ),
              ),

              Icon(
                Icons.share_outlined,
                color: Colors.grey[500],
              ),

              const SizedBox(width: 12),

              Icon(
                Icons.copy_outlined,
                color: Colors.grey[500],
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// معلومات الكتاب
          Wrap(
            spacing: 16,
            runSpacing: 10,

            children: [

              _infoItem(
                Icons.verified_outlined,
                book.editor ?? '',
              ),

              _infoItem(
                Icons.sell_outlined,
                book.categoryName ?? '',
              ),

              _infoItem(
                Icons.person_outline,
                book.authorName ?? '',
              ),
            ],
          ),

          const SizedBox(height: 16),

          Divider(
            color: Colors.grey.shade300,
          ),

          const SizedBox(height: 12),

          /// Buttons
          Row(
            children: [

              _actionButton(
                context: context,
                icon: Icons.menu_book_outlined,
                text: "قراءة",
                isSelected: true,

                onTap: () {

                  Navigator.pushNamed(
                    context,
                    PageRouteName.pages,

                    arguments: book.id,
                  );
                },
              ),

              _actionButton(
                context: context,
                icon: Icons.list_outlined,
                text: "الفهرس",
              ),

              _actionButton(
                context: context,
                icon: Icons.bookmark_border,
                text: "حفظ",
              ),

              _actionButton(
                context: context,
                icon: Icons.download_outlined,
                text: "تحميل",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(
      IconData icon,
      String text,
      ) {

    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [

        Icon(
          icon,
          size: 16,
          color: Colors.grey[700],
        ),

        const SizedBox(width: 4),

        Text(
          text,

          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _actionButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {

    return Expanded(
      child: GestureDetector(

        onTap: onTap,

        child: Container(
          height: 50,

          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),

          decoration: BoxDecoration(
            color: isSelected
                ? AppColor.primary
                : const Color(0xFFEAE7E2),

            borderRadius: BorderRadius.circular(18),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Icon(
                icon,
                size: 20,

                color: isSelected
                    ? Colors.white
                    : Colors.black87,
              ),

              const SizedBox(height: 6),

              Text(
                text,

                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w500,

                  color: isSelected
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}