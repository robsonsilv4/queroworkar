import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

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
            return _body(jobs: state.jobs);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'QueroWorkar',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.search),
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
            child: Text('data'),
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
                            Text(
                              'Ver mais...',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.share,
                              size: 16,
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailScreen(
                jobTitle: jobs[index].title,
                jobUrl: jobs[index].url,
              );
            },
          ),
        );
      },
    );
  }
}
