import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/contact_form_entity.dart';

abstract class ContactPageRepository {
  Future<Either<Failure, bool>> submitContactForm(ContactFormEntity contactFormEntity);
}
