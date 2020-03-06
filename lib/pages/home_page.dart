import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:share/share.dart';

import '../blocs/jobs/jobs_bloc.dart';
import '../blocs/jobs/jobs_state.dart';
import '../models/job_model.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JobsBloc, JobsState>(
        // bloc: BlocProvider.of<JobsBloc>(context),
        builder: (context, state) {
          if (state is JobsLoaded) {
            return SafeArea(
              child: _body(jobs: state.jobs),
            );
          }

          return _loading();
        },
      ),
    );
  }

  Widget _body({@required List<Job> jobs}) {
    return jobs.isNotEmpty
        ? Column(
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
                        'assets/branding.png',
                        width: 145.0,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.info,
                      color: Colors.black54,
                      size: 24.0,
                    ),
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
                        'assets/logo.png',
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nós encontramos ',
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextSpan(
                            text: jobs.length.toString(),
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                          TextSpan(
                            text: ' vagas para você.',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      return _jobItem(jobs, index, context);
                    },
                  ),
                ),
              ),
            ],
          )
        : Center(
            child: Text(
              'Não há vagas disponíveis no momento :(',
            ),
          );
  }

  Widget _loading() {
    return Center(
      child: Loading(
        indicator: BallPulseIndicator(),
        size: 50.0,
        color: Colors.red,
      ),
    );
  }

  Widget _jobItem(List<Job> jobs, int index, BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: jobs[index].image.isNotEmpty
                        ? NetworkImage(jobs[index].image)
                        : AssetImage('assets/company_logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  // Utilizar Expanded ou Flexible
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              jobs.elementAt(index).title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 1.0),
                            Text(
                              jobs.elementAt(index).date,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                'Ver mais...',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => _toDetail(
                                context: context,
                                job: jobs.elementAt(index),
                              ),
                            ),
                            Spacer(),
                            JobShare(
                              job: jobs.elementAt(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onDoubleTap: () => _toDetail(
        context: context,
        job: jobs.elementAt(index),
      ),
      onLongPress: () => _toDetail(
        context: context,
        job: jobs.elementAt(index),
      ),
    );
  }

  _toDetail({BuildContext context, Job job}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(
            jobTitle: job.title,
            jobUrl: job.url,
          );
        },
      ),
    );
  }
}

class JobShare extends StatelessWidget {
  final Job job;

  JobShare({@required this.job});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        Icons.share,
        size: 16,
      ),
      onTap: () {
        return _share(
          context: context,
          url: job.url,
        );
      },
    );
  }

  _share({BuildContext context, String url}) {
    final RenderBox box = context.findRenderObject();

    Share.share(
      url,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
