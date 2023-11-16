import 'package:equatable/equatable.dart';

class ContactFormEntity extends Equatable {
  final String name;
  final String email;
  final String message;

  const ContactFormEntity({required this.name, required this.email, required this.message});

  @override
  List<Object?> get props => [name, email, message];
}
