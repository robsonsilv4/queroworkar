import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quero_workar/blocs/jobs/jobs_event.dart';
import 'package:quero_workar/blocs/jobs/jobs_state.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:quero_workar/data/repositories/repositories.dart';

class JobsBloc extends HydratedBloc<JobsEvent, JobsState> {
  JobsBloc({required this.jobsRepository}) : super(JobsLoading()) {
    on<LoadJobs>(_mapLoadJobsToState);
  }

  final JobRepository jobsRepository;

  @override
  JobsState fromJson(Map<String, dynamic> json) {
    try {
      final jobs = (json['jobs'] as List)
          .map((job) => Job.fromJson(job as Map<String, dynamic>))
          .toList();
      return JobsLoaded(jobs: jobs);
    } on Exception catch (_) {
      return JobsNotLoaded();
    }
  }

  @override
  Map<String, dynamic> toJson(JobsState state) {
    if (state is JobsLoaded) {
      final jobs = state.jobs.map((job) => job.toJson()).toList();
      return {'jobs': jobs};
    }

    return {};
  }

  Future<void> _mapLoadJobsToState(
    LoadJobs event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsLoading());

    try {
      final jobs = await jobsRepository.getJobs();

      emit(JobsLoaded(jobs: jobs));
    } on Exception catch (_) {
      emit(JobsNotLoaded());
    }
  }
}
