import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './jobs_event.dart';
import './jobs_state.dart';
import '../../repositoires/job_repository.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepository jobsRepository;

  JobsBloc({@required this.jobsRepository});

  @override
  JobsState get initialState => JobsLoading();

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
