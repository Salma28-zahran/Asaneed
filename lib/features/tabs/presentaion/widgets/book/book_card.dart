import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/data/BooksResponseModel.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCard extends StatelessWidget {
  final BookModel book;

  const BookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () {
      print("BOOK ID: ${book.id}");

      Navigator.pushNamed(
        context,
        PageRouteName.book_details,
        arguments: book.id,
      );

      },
      child: Container(
        margin:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.getContainerColor(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColor.getborder(context),
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.getContainerColor(context),
                  borderRadius:
                  BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.menu_book_outlined,
                  color: AppColor.primary,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title ?? '',
                      style: GoogleFonts.inter(
                        fontSize: width * 0.040,
                        fontWeight: FontWeight.w600,
                        color: AppColor.getBlack(context),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 16,
                          color: Color(0xff6B7280),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          book.authorName ?? '',
                          style: GoogleFonts.inter(
                            fontSize: width * 0.032,
                            color:
                            const Color(0xff6B7280),
                          ),
                        ),

                        const SizedBox(width: 12),

                        const Icon(
                          Icons.sell_outlined,
                          size: 16,
                          color: Color(0xff6B7280),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          book.categoryName ?? '',
                          style: GoogleFonts.inter(
                            fontSize: width * 0.032,
                            color:
                            const Color(0xff6B7280),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "  ${book.size ?? ''}",
                      style: GoogleFonts.inter(
                        fontSize: width * 0.032,
                        color: const Color(0xff6B7280),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              const Icon(
                Icons.more_vert,
                color: Color(0xff6B7280),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


