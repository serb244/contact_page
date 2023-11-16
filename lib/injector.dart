import 'package:get_it/get_it.dart';

import 'core/network/network_client.dart';
import 'features/contact_page/data/data_sources/contact_page_remote_data_source.dart';
import 'features/contact_page/data/repositories/contact_page_repository_impl.dart';
import 'features/contact_page/domain/repositories/contact_page_repository.dart';
import 'features/contact_page/domain/use_cases/submit_contact_page_use_case.dart';
import 'features/contact_page/presentation/manager/contact_page_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  /// NetworkClient
  injector.registerLazySingleton(() => NetworkClient.getDioInstance());

  ///Remote Data Source ///
  injector.registerLazySingleton<ContactPageRemoteDataSource>(
    () => ContactPageRemoteDataSourceImpl(dio: injector()),
  );

  /// Repository ///
  injector.registerLazySingleton<ContactPageRepository>(() => ContactPageRepositoryImpl(
        contactPageRemoteDataSource: injector<ContactPageRemoteDataSource>(),
      ));

  /// UseCase ///
  injector.registerLazySingleton(() => SubmitContactPageUseCase(repository: injector()));

  /// BloC ///
  injector.registerFactory(
    () => ContactPageBloc(submitContactPageUseCase: injector()),
  );
}
