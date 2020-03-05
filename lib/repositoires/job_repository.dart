import 'package:html/parser.dart';
import 'package:http/http.dart';

import '../models/job_detail_model.dart';
import '../models/job_model.dart';

class JobsRepository {
  final Client client;

  JobsRepository({this.client});

  Future<List<Job>> getJobs() async {
    final jobs = List<Job>();
    final imagePlaceholder =
        'https://queroworkar.com.br/wp-content/themes/noo-jobmonster/assets/images/company-logo.png';

    try {
      final response = await client.get('https://queroworkar.com.br/');
      final document = parse(response.body);

      final articles = document.getElementsByTagName('article');

      articles.forEach((article) {
        String image;
        try {
          image = article.querySelector('img').attributes['src'];
        } catch (error) {
          image = imagePlaceholder;
        }

        final title = article.querySelector('h2').text.trim();
        final url = article.querySelector('a').attributes['href'];

        jobs.add(
          Job(
            image: image,
            title: title,
            url: url,
          ),
        );
      });
    } catch (error) {
      print(error.toString());
    }

    return jobs;
  }

  Future<JobDetail> getJobDetail(String url) async {
    final response = await client.get(url);
    final document = parse(response.body);

    // TODO: Melhorar seleções
    String title = document
        .getElementsByClassName('page-title')
        .first
        .querySelector('span')
        .text;
    String date =
        document.getElementsByTagName('time').first.attributes['datetime'];
    String description =
        document.getElementsByClassName('job-desc').first.innerHtml;

    return JobDetail(
      title: title,
      date: date,
      description: description,
    );
  }
}
