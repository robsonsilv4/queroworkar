import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../models/job_model.dart';

class JobsRepository {
  final Client client;
  final String url;

  JobsRepository({
    this.client,
    this.url = 'https://queroworkar.com.br/',
  });

  Future<List<Job>> getJobs() async {
    final jobs = List<Job>();

    try {
      final response = await client.get(url);
      final document = parse(response.body);

      final articles = document.getElementsByTagName('article');

      articles.forEach((article) {
        jobs.add(parseJob(article));
      });
    } catch (error) {
      print(error.toString());
    }

    return jobs;
  }

  Future<String> getJobDetail(String url) async {
    final response = await client.get(url);
    final document = parse(response.body);

    return document.getElementsByClassName('job-desc').first.innerHtml;
  }

  Job parseJob(Element article) {
    try {
      String image;

      // Imagem
      try {
        image = article.querySelector('img').attributes['src'];
      } catch (error) {
        image = '';
      }

      // Título e endereço
      final title = article.querySelector('h2').text.trim();
      final url = article.querySelector('a').attributes['href'];

      // Data
      final date = article.querySelector('time').attributes['datetime'];
      final formatedDate = DateFormat('dd-MM-yyyy').format(
        DateTime.parse(date),
      );

      return Job(
        image: image,
        title: title,
        date: formatedDate,
        url: url,
      );
    } catch (error) {
      return null;
    }
  }
}
