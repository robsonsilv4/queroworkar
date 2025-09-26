part of 'jobs_bloc.dart';

sealed class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

final class JobsLoading extends JobsState {
  const JobsLoading();
}

final class JobsLoaded extends JobsState {
  const JobsLoaded({this.jobs = const []});

  final List<Job> jobs;

  @override
  List<Object> get props => [jobs];
}

class JobsNotLoaded extends JobsState {
  const JobsNotLoaded();
}
