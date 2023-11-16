import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../../domain/entities/contact_form_entity.dart';
import '../../domain/repositories/contact_page_repository.dart';
import '../data_sources/contact_page_remote_data_source.dart';
import '../models/contact_form_data_model.dart';

class ContactPageRepositoryImpl implements ContactPageRepository {
  final ContactPageRemoteDataSource contactPageRemoteDataSource;

  const ContactPageRepositoryImpl({
    required this.contactPageRemoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> submitContactForm(ContactFormEntity contactFormEntity) async {
    try {
      ContactFormModel contactFormModel = ContactFormModel.fromEntity(contactFormEntity);
      final bool result = await contactPageRemoteDataSource.submitContactForm(contactFormModel);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
