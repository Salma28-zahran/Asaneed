import 'package:asaneed/features/tabs/presentaion/views/book/bloc/book_pages/BookPagesCubit.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/bloc/book_pages/BookPagesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookPagesScreen extends StatelessWidget {
  const BookPagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookPagesCubit()..getBookPages(id: 15),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Pages'),
        ),

        body: BlocBuilder<BookPagesCubit, BookPagesState>(
          builder: (context, state) {

            if (state is BookPagesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is BookPagesError) {
              return Center(
                child: Text(state.error),
              );
            }

            if (state is BookPagesSuccess) {

              final model = state.model;

              return ListView.builder(
                itemCount: model.pages.length,

                itemBuilder: (context, index) {

                  final page = model.pages[index];

                  return Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      children: [

                        CircleAvatar(
                          child: Text(
                            page.pageNumber.toString(),
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Text(
                            'Page ${page.pageNumber}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        if (page.highlighted)
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      ],
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}