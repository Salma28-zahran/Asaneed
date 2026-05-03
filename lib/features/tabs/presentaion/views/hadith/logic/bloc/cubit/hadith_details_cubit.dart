import 'package:asaneed/features/tabs/presentaion/views/hadith/data/services/hadith_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/services/hadith_details_services.dart';
import '../state/hadith_details_state.dart';

class HadithDetailsCubit extends Cubit<HadithDetailsState> {
  HadithDetailsCubit(HadithService hadithService) : super(HadithDetailsInitial());

  Future<void> getHadithDetails(int id) async {
    emit(HadithDetailsLoading());

    try {
      final data = await HadithDetailsService.fetchHadithDetails(id);
      emit(HadithDetailsLoaded(data));
    } catch (e) {
      emit(HadithDetailsError(e.toString()));
    }
  }
}