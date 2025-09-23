import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/models/job_model.dart';
import '../../data/repositoires/job_repository.dart';
import './jobs_event.dart';
import './jobs_state.dart';

class JobsBloc extends HydratedBloc<JobsEvent, JobsState> {
  final JobsRepository jobsRepository;

  JobsBloc({required this.jobsRepository}) : super(JobsLoading()) {
    on<LoadJobs>((event, emit) => _mapLoadJobsToState(event, emit));
  }

  @override
  JobsState fromJson(Map<String, dynamic> json) {
    try {
      final jobs = json['jobs'].map((job) => Job.fromJson(job)).toList();
      return JobsLoaded(jobs: jobs);
    } catch (error) {
      // return null;
      return JobsNotLoaded();
    }
  }

  @override
  Map<String, dynamic> toJson(JobsState state) {
    if (state is JobsLoaded) {
      final jobs = state.jobs.map((job) => job.toJson()).toList();
      return {'jobs': jobs};
    }

    // return null;
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
    } catch (error) {
      emit(JobsNotLoaded());
    }
  }
}
