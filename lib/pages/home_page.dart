import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import '../models/job_model.dart';
import '../repositoires/job_repository.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final jobRepository = JobsRepository(client: Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QueroWorkar'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: FutureBuilder(
        future: jobRepository.getJobs(),
        builder: (contex, snapshot) {
          if (snapshot.hasData) {
            final List<Job> jobs = snapshot.data;

            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(jobs[index].image),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    jobs[index].title,
                    overflow: TextOverflow.ellipsis,
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
              },
            );
          }

          return Center(
            child: Loading(
              indicator: BallPulseIndicator(),
              size: 50.0,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
