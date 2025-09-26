import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_workar/blocs/blocs.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:quero_workar/shared/constants/constants.dart';
import 'package:quero_workar/shared/widgets/info_widget.dart';
import 'package:quero_workar/shared/widgets/loading_qw.dart';
import 'package:quero_workar/ui/pages/home_page/widgets/job_item.dart';
import 'package:quero_workar/ui/pages/home_page/widgets/jobs_quantity.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JobsBloc, JobsState>(
        builder: (context, state) {
          if (state is JobsLoaded) {
            return _HomeBody(jobs: state.jobs);
          }
          return const _HomeBody(jobs: []);
        },
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    // Keep default size parameter
    // ignore: unused_element_parameter
    this.bradingImageSize = 145,
    this.padding,
  });

  final double bradingImageSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Image.asset(
              Images.branding,
              width: bradingImageSize,
              cacheWidth: bradingImageSize.ceil(),
            ),
          ),
          const Spacer(),
          const Info(),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const _HomeHeader(padding: EdgeInsets.all(20)),
          JobsQuantity(
            quantity: jobs.length,
            padding: const EdgeInsets.only(left: 22, bottom: 10),
          ),
          Expanded(
            child: jobs.isNotEmpty
                ? _JobList(jobs: jobs)
                : const LoadingQW(size: 50),
          ),
        ],
      ),
    );
  }
}

class _JobList extends StatelessWidget {
  const _JobList({required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (_, index) => JobItem(
        job: jobs.elementAt(index),
      ),
    );
  }
}
