import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get_it/get_it.dart';
import 'package:quero_workar/blocs/jobs/jobs.dart';
import 'package:quero_workar/data/repositories/repositories.dart';
import 'package:quero_workar/shared/constants/api.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl
    ..registerLazySingleton<JobRepository>(
      () {
        final dio = Dio();
        dio.interceptors.add(
          DioCacheManager(
            CacheConfig(baseUrl: Api.baseUrl),
          ).interceptor as Interceptor,
        );

        return JobHtmlRepository(
          client: dio,
        );
      },
    )
    ..registerLazySingleton<JobsEvent>(LoadJobs.new);
}
