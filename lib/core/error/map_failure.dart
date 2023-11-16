import '../constants/strings.dart';
import 'failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverErrorMessage;
    default:
      return defaultErrorMessage;
  }
}
