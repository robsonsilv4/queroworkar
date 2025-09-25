import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:quero_workar/blocs/jobs/jobs.dart';
import 'package:quero_workar/data/repositories/repositories.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl
    ..registerLazySingleton<Dio>(
      () {
        final cacheOptions = CacheOptions(
          store: MemCacheStore(),
          hitCacheOnErrorCodes: [500],
          hitCacheOnNetworkFailure: true,
          maxStale: const Duration(days: 2),
        );
        return Dio()
          ..interceptors.add(DioCacheInterceptor(options: cacheOptions));
      },
    )
    ..registerLazySingleton<JobRepository>(
      () {
        return JobInMemoryRepository();
        // Uncomment below to use HTML repository
        // return JobHtmlRepository(
        //   client: sl.get<Dio>(),
        // );
      },
    )
    ..registerLazySingleton<JobsEvent>(LoadJobs.new);
}
