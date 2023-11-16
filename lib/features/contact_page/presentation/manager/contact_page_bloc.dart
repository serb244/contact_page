import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/error.dart';
import '../../domain/entities/contact_form_entity.dart';
import '../../domain/use_cases/submit_contact_page_use_case.dart';

part 'contact_page_event.dart';

part 'contact_page_state.dart';

class ContactPageBloc extends Bloc<ContactPageEvent, ContactPageState> {
  SubmitContactPageUseCase submitContactPageUseCase;

  ContactPageBloc({required this.submitContactPageUseCase}) : super(ContactPageInitialState()) {
    on<ContactPageSendFormEvent>(_sendForm);
  }

  void _sendForm(ContactPageSendFormEvent event, Emitter<ContactPageState> emit) async {
    emit(ContactPageLoadingState());
    ContactFormEntity contactFormEntity = event.contactFormEntity;
    final Either<Failure, bool> submitResult = await submitContactPageUseCase(
      Params(contactFormEntity: contactFormEntity),
    );
    submitResult.fold(
      (failure) => emit(
        ContactPageErrorState(
          mapFailureToMessage(failure),
        ),
      ),
      (r) => emit(
        const ContactPageSuccessState(AppTexts.serverSuccessMessage),
      ),
    );
  }
}
