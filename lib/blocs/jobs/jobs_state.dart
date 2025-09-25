import 'package:equatable/equatable.dart';
import 'package:quero_workar/data/models/job_model.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  const JobsLoaded({this.jobs = const []});

  final List<Job> jobs;

  @override
  List<Object> get props => [jobs];
}

class JobsNotLoaded extends JobsState {}
