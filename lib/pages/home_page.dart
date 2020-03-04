import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
        future: jobRepository.getAllJobs(),
        builder: (contex, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Job> jobs = snapshot.data;

          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ListTile(
                  title: Text(
                    jobs[index].title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(
                          job: jobs[index],
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
