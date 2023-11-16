import 'package:dio/dio.dart';

import '../../../../core/error/error.dart';
import '../models/contact_form_data_model.dart';

abstract class ContactPageRemoteDataSource {
  Future<bool> submitContactForm(ContactFormModel contactFormModel);
}

class ContactPageRemoteDataSourceImpl implements ContactPageRemoteDataSource {
  ///Api
  static const String contactPageEndPoint = 'https://api.byteplex.info/api/test/contact/';
  final Dio dio;

  ContactPageRemoteDataSourceImpl({required this.dio});

  @override
  Future<bool> submitContactForm(ContactFormModel contactFormModel) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      final Map<String, dynamic> data = contactFormModel.toJson();
      final response = await dio.post(
        contactPageEndPoint,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
