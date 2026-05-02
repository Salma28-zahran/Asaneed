import '../../../data/models/hadith_model.dart';
import '../../../data/services/hadith_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/hadith_state.dart';
class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial());

  List<HadithModel> hadithList = [];

  Future<void> loadHadith() async {
    emit(HadithLoading());
    try {
      final data = await HadithService.fetchHadith();
      hadithList = data;

      emit(HadithLoaded(data));
    } catch (e) {
      emit(HadithError(e.toString()));
    }
  }
}