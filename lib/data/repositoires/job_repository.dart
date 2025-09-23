import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:quero_workar/shared/constants/api.dart';

class JobsRepository {
  JobsRepository({
    required this.client,
    this.url = Api.baseUrl,
  });

  final Dio client;
  final String url;

  /// Retorna a lista de vagas.
  ///
  /// Preenchida com as vagas mais recentes
  /// ou vazia se ocorreu algum erro.
  Future<List<Job>> getJobs() async {
    final jobs = <Job>[];

    try {
      final response = await client.get<String>(url);

      if (response.statusCode == 200) {
        final document = parse(response.data);

        final articles = document.getElementsByTagName('article');

        for (final article in articles) {
          final job = parseJob(article);
          if (job != null) jobs.add(job);
        }
      }

      return jobs;
    } on Exception catch (error) {
      dev.log('Error fetching jobs: $error');
    }

    return jobs;
  }

  Future<String> getJobDetail(String url) async {
    final response = await client.get<String>(url);
    final document = parse(response.data);

    return document.getElementsByClassName('job-desc').first.innerHtml;
  }

  Job? parseJob(Element article) {
    try {
      String image;

      // Imagem
      try {
        image = article.querySelector('img')?.attributes['src'] ?? '';
      } on Exception catch (_) {
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
    } on Exception catch (_) {
      return null;
    }
  }
}
