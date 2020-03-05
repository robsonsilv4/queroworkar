import 'package:equatable/equatable.dart';

abstract class JobsEvent extends Equatable {
  JobsEvent();

  @override
  List<Object> get props => [];
}

class LoadJobs extends JobsEvent {}
