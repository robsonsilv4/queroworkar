import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quero_workar/data/models/models.dart';
import 'package:quero_workar/data/repositories/repositories.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends HydratedBloc<JobsEvent, JobsState> {
  JobsBloc({required JobRepository jobsRepository})
    : _jobRepository = jobsRepository,
      super(const JobsLoading()) {
    on<LoadJobs>(_onLoadJobs);
  }

  final JobRepository _jobRepository;

  @override
  JobsState fromJson(Map<String, dynamic> json) {
    try {
      final jobs = (json['jobs'] as List)
          .map((job) => Job.fromJson(job as Map<String, dynamic>))
          .toList();
      return JobsLoaded(jobs: jobs);
    } on Exception catch (_) {
      return const JobsNotLoaded();
    }
  }

  @override
  Map<String, dynamic>? toJson(JobsState state) {
    if (state is JobsLoaded) {
      final jobs = state.jobs.map((job) => job.toJson()).toList();
      return {'jobs': jobs};
    }

    return null;
  }

  Future<void> _onLoadJobs(
    LoadJobs event,
    Emitter<JobsState> emit,
  ) async {
    emit(const JobsLoading());

    try {
      final jobs = await _jobRepository.getJobs();
      emit(JobsLoaded(jobs: jobs));
    } on Exception catch (_) {
      emit(const JobsNotLoaded());
    }
  }
}
