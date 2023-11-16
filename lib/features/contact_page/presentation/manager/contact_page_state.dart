part of 'contact_page_bloc.dart';

abstract class ContactPageState extends Equatable {
  const ContactPageState();
  String? get message => null;
}

class ContactPageInitialState extends ContactPageState {
  @override
  List<Object> get props => [];
}

class ContactPageLoadingState extends ContactPageState {
  @override
  List<Object> get props => [];
}

class ContactPageSuccessState extends ContactPageState {
  @override
  final String message;

  const ContactPageSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class ContactPageErrorState extends ContactPageState {
  @override
  final String message;

  const ContactPageErrorState(this.message);

  @override
  List<Object> get props => [message];
}
