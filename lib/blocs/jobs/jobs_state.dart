import 'package:equatable/equatable.dart';

import '../../models/job_model.dart';

abstract class JobsState extends Equatable {
  JobsState();

  @override
  List<Object> get props => [];
}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  final List<Job> jobs;

  JobsLoaded({this.jobs = const []});

  @override
  List<Object> get props => [jobs];
}

class JobsNotLoaded extends JobsState {}
