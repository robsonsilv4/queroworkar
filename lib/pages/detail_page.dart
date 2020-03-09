import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import '../repositoires/job_repository.dart';
import '../service_locator.dart';

class DetailScreen extends StatelessWidget {
  final jobRepository = sl.get<JobsRepository>();

  final String jobTitle;
  final String jobUrl;

  DetailScreen({
    @required this.jobTitle,
    @required this.jobUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: Text(
          jobTitle,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: jobRepository.getJobDetail(jobUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final String jobDetail = snapshot.data;

            return SingleChildScrollView(
              child: Html(
                data: jobDetail,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                // backgroundColor: Colors.white,
              ),
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
