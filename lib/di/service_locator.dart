import 'package:get_it/get_it.dart';
import 'package:quero_workar/blocs/jobs/jobs.dart';
import 'package:quero_workar/data/repositories/repositories.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl
    ..registerLazySingleton<JobRepository>(
      () {
        return JobInMemoryRepository();
        // Uncomment below to use HTML repository
        // final dio = Dio();
        // dio.interceptors.add(
        //   DioCacheManager(
        //     CacheConfig(baseUrl: Api.baseUrl),
        //   ).interceptor as Interceptor,
        // );

        // return JobHtmlRepository(
        //   client: dio,
        // );
      },
    )
    ..registerLazySingleton<JobsEvent>(LoadJobs.new);
}
