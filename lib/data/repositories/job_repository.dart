import 'package:quero_workar/data/models/job_model.dart';

abstract class JobRepository {
  Future<List<Job>> getJobs();
  Future<String> getJobDetail(String url);
}
