part of 'jobs_bloc.dart';

sealed class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

final class LoadJobs extends JobsEvent {
  const LoadJobs();
}
