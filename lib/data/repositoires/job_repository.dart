import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import '../../shared/constants/api.dart';
import '../models/job_model.dart';

class JobsRepository {
  final Dio client;
  final String url;

  JobsRepository({
    required this.client,
    this.url = Api.baseUrl,
  });

  /// Retorna a lista de vagas.
  ///
  /// Preenchida com as vagas mais recentes
  /// ou vazia se ocorreu algum erro.
  Future<List<Job>> getJobs() async {
    final jobs = <Job>[];

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final document = parse(response.data);

        final articles = document.getElementsByTagName('article');

        articles.forEach((article) {
          final job = parseJob(article);
          if (job != null) jobs.add(job);
        });
      }

      return jobs;
    } catch (error) {
      print(error.toString());
    }

    return jobs;
  }

  Future<String> getJobDetail(String url) async {
    final response = await client.get(url);
    final document = parse(response.data);

    return document.getElementsByClassName('job-desc').first.innerHtml;
  }

  Job? parseJob(Element article) {
    try {
      String image;

      // Imagem
      try {
        image = article.querySelector('img')?.attributes['src'] ?? '';
      } catch (error) {
        image = '';
      }

      // Título e endereço
      final title = article.querySelector('h2')?.text.trim() ?? '';
      final url = article.querySelector('a')?.attributes['href'] ?? '';

      // Data
      final date = article
          .getElementsByClassName(
            'job-date-ago',
          )
          .first
          .text;

      return Job(
        image: image,
        title: title,
        date: date,
        url: url,
      );
    } catch (error) {
      return null;
    }
  }
}
