import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import './jobs_event.dart';
import './jobs_state.dart';
import '../../data/models/job_model.dart';
import '../../data/repositoires/job_repository.dart';

class JobsBloc extends HydratedBloc<JobsEvent, JobsState> {
  final JobsRepository jobsRepository;

  JobsBloc({@required this.jobsRepository});

  @override
  JobsState get initialState {
    return super.initialState ?? JobsLoading();
  }

  @override
  JobsState fromJson(Map<String, dynamic> json) {
    try {
      final jobs = json['jobs'].map((job) => Job.fromJson(job)).toList();
      return JobsLoaded(jobs: jobs);
    } catch (error) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(JobsState state) {
    if (state is JobsLoaded) {
      final jobs = state.jobs.map((job) => job.toJson()).toList();
      return {'jobs': jobs};
    }

    return null;
  }

  @override
  Stream<JobsState> mapEventToState(JobsEvent event) async* {
    if (event is LoadJobs) {
      yield* _mapLoadJobsToState();
    }
  }

  Stream<JobsState> _mapLoadJobsToState() async* {
    try {
      final jobs = await jobsRepository.getJobs();

      yield JobsLoaded(jobs: jobs);
    } catch (error) {
      yield JobsNotLoaded();
    }
  }
}
