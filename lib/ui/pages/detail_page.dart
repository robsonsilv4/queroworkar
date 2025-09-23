import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../data/repositoires/job_repository.dart';
import '../../di/service_locator.dart';

class DetailScreen extends StatelessWidget {
  final jobRepository = sl.get<JobsRepository>();

  final String jobTitle;
  final String jobUrl;

  DetailScreen({required this.jobTitle, required this.jobUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          jobTitle,
          style: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder<String>(
        future: jobRepository.getJobDetail(jobUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final jobDetail = snapshot.data;

            if (jobDetail == null || jobDetail.isEmpty) {
              return Center(
                child: Text('Não foi possível carregar os detalhes.'),
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Html(
                data: jobDetail,
                // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                // backgroundColor: Colors.white,
              ),
            );
          }

          return Center(
            child: SizedBox.square(
              dimension: 50.0,
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
