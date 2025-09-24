import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quero_workar/data/repositories/job_repository.dart';
import 'package:quero_workar/di/service_locator.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({required this.jobTitle, required this.jobUrl, super.key});
  final JobsRepository jobRepository = sl.get<JobsRepository>();

  final String jobTitle;
  final String jobUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          jobTitle,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<String>(
        future: jobRepository.getJobDetail(jobUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final jobDetail = snapshot.data;

            if (jobDetail == null || jobDetail.isEmpty) {
              return const Center(
                child: Text('Não foi possível carregar os detalhes.'),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Html(
                data: jobDetail,
              ),
            );
          }

          return const Center(
            child: SizedBox.square(
              dimension: 50,
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
