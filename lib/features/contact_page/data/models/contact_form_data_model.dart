import '../../domain/entities/contact_form_entity.dart';

class ContactFormModel extends ContactFormEntity {
  const ContactFormModel({
    required String name,
    required String email,
    required String message,
  }) : super(name: name, email: email, message: message);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }

  factory ContactFormModel.fromEntity(ContactFormEntity entity) {
    return ContactFormModel(
      name: entity.name,
      email: entity.email,
      message: entity.message,
    );
  }
}
