part of 'contact_page_bloc.dart';

abstract class ContactPageEvent extends Equatable {
  const ContactPageEvent();
}

class ContactPageSendFormEvent extends ContactPageEvent {
  final ContactFormEntity contactFormEntity;

  const ContactPageSendFormEvent(this.contactFormEntity);

  @override
  List<Object> get props => [contactFormEntity];
}
