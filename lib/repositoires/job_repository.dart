import 'package:html/parser.dart';
import 'package:http/http.dart';

import '../models/job_model.dart';

class JobsRepository {
  final Client client;

  JobsRepository({this.client});

  Future<List<Job>> getAllJobs() async {
    final jobList = List<Job>();

    final response = await client.get('https://queroworkar.com.br/');
    final document = parse(response.body);

    final jobs = document.getElementsByClassName('job-details-link');

    for (var job in jobs) {
      final response = await client.get(job.attributes['href']);
      final document = parse(response.body);

      String title = document
          .getElementsByClassName('page-title')
          .first
          .querySelector('span')
          .text;
      String date =
          document.getElementsByTagName('time').first.attributes['datetime'];
      String description =
          document.getElementsByClassName('job-desc').first.innerHtml;

      jobList.add(Job(
        title: title,
        date: date,
        description: description,
      ));
    }

    return jobList;
  }
}
