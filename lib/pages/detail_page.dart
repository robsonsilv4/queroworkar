import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../models/job_model.dart';

class DetailScreen extends StatelessWidget {
  final Job job;

  const DetailScreen({@required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Html(
            data: job.description,
            padding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}
