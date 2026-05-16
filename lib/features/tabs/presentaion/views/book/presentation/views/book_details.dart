import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/bloc/book_details/BookDetailsCubit.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/bloc/book_details/BookDetailsStates.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/book/details/BookIndexSection.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/book/details/BookInfoSection.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/book/details/BookStatsGrid.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/book/details/BookTopCard.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetails extends StatefulWidget {
  final int id;

  const BookDetails({super.key, required this.id});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookDetailsCubit()..getBookDetails(id: widget.id),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColor.getAppBarColor(context),
          title: Text("تفاصيل الكتاب", style: AppColor.textBlack(context)),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<BookDetailsCubit, BookDetailsStates>(
            builder: (context, state) {
              if (state is BookDetailsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is BookDetailsErrorState) {
                return Center(child: Text(state.error));
              }

              final book = BookDetailsCubit.get(context).bookDetailsModel;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    BookTopCard(
                      book: book!,
                    ),

                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        book?.title ?? '',
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.getContainerColor(context),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColor.getborder(context),
                          ),
                        ),
                        child: Text(
                          book?.categoryName ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.getBlack(context),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    BookStatsGrid(
                      size: book.size ?? 0,
                      numberOfParts: book.numberOfParts ?? 0,
                      hijriDate: book.editionDateHijri ?? '',
                    ),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.primary4,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            AssetsManager.hicon,
                            height: 30,
                            width: 20,
                            color: AppColor.getBlack(context),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            "${book?.numberOfParts ?? ''}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.getBlack(context),
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "الأحاديث في هذا الكتاب",
                            style: TextStyle(color: AppColor.getBlack(context)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    BookInfoSection(
                      publisher: book?.publisher ?? '',
                      editor: book?.editor ?? '',
                      editionNumber: book?.editionNumber ?? 0,
                    ),

                    const SizedBox(height: 15),

                    const BookIndexSection(),

                    const SizedBox(height: 15),

                    Container(
                      width: double.infinity,
                      height: 114,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.getContainerColor(context),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColor.getborder(context)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AssetsManager.hicon,
                                color: AppColor.getBlack(context),
                              ),

                              const SizedBox(width: 6),

                              Text(
                                "الأحاديث المتعلقة",
                                style: GoogleFonts.scheherazadeNew(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const Spacer(),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "لا توجد أحاديث متاحة لهذا الكتاب بعد.",
                              style: TextStyle(color: Colors.grey[600]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _infoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[700]),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String text,
    bool isSelected = false,
  }) {
    return Expanded(
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : const Color(0xFFEAE7E2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            const SizedBox(height: 6),
            Text(
              text,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _divider() {
    return Divider(color: Colors.grey.shade300, height: 1);
  }
}
