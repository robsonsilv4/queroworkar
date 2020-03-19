import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../data/models/job_model.dart';
import '../../../shared/constants/images.dart';
import '../../../shared/widgets/info_widget.dart';
import '../../../shared/widgets/loading_qw.dart';
import 'widgets/job_item.dart';
import 'widgets/jobs_quantity.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JobsBloc, JobsState>(
        builder: (context, state) {
          if (state is JobsLoaded) {
            return _body(
              jobs: state.jobs,
              context: context,
            );
          }

          return _body(
            jobs: [],
            context: context,
          );
        },
      ),
    );
  }

  Widget _body({
    @required List<Job> jobs,
    BuildContext context,
  }) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: Image.asset(
                    Images.branding,
                    width: 145.0,
                  ),
                ),
                Spacer(),
                Info(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
              bottom: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Image.asset(
                    Images.logo,
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                JobsQuantity(quantity: jobs.length),
              ],
            ),
          ),
          Expanded(
            child: jobs.isNotEmpty
                ? _jobList(jobs: jobs)
                : LoadingQW(
                    size: 50.0,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _jobList({@required List<Job> jobs}) {
    return Container(
      child: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return JobItem(
            job: jobs.elementAt(index),
          );
        },
      ),
    );
  }
}
