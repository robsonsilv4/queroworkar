import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quero_workar/blocs/blocs.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:quero_workar/shared/constants/images.dart';
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
    required List<Job> jobs,
    required BuildContext context,
  }) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: Image.asset(
                    Images.branding,
                    width: 145,
                  ),
                ),
                const Spacer(),
                const Info(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              bottom: 10,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Image.asset(
                    Images.logo,
                    width: 20,
                    height: 20,
                  ),
                ),
                JobsQuantity(quantity: jobs.length),
              ],
            ),
          ),
          Expanded(
            child: jobs.isNotEmpty
                ? _jobList(jobs: jobs)
                : const LoadingQW(
                    size: 50,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _jobList({required List<Job> jobs}) {
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
