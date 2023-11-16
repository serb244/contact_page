import '../constants/strings.dart';
import 'failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppTexts.serverErrorMessage;
    default:
      return AppTexts.defaultErrorMessage;
  }
}
