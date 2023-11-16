import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/contact_form_entity.dart';
import '../repositories/contact_page_repository.dart';

class SubmitContactPageUseCase implements UseCase<bool, Params> {
  final ContactPageRepository repository;

  SubmitContactPageUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.submitContactForm(params.contactFormEntity);
  }
}

class Params extends Equatable {
  final ContactFormEntity contactFormEntity;

  const Params({required this.contactFormEntity});

  @override
  List<Object> get props => [contactFormEntity];
}
