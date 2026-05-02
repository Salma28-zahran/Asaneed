
import '../../../data/models/hadith_details_model.dart';

abstract class HadithDetailsState {}

class HadithDetailsInitial extends HadithDetailsState {}

class HadithDetailsLoading extends HadithDetailsState {}

class HadithDetailsLoaded extends HadithDetailsState {
  final HadithDetailsModel data;

  HadithDetailsLoaded(this.data);
}

class HadithDetailsError extends HadithDetailsState {
  final String error;

  HadithDetailsError(this.error);
}