import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:quero_workar/data/repositories/job_repository.dart';
import 'package:quero_workar/shared/constants/api.dart';

class JobHtmlRepository implements JobRepository {
  JobHtmlRepository({
    required Dio client,
    String url = Api.baseUrl,
  })  : _url = url,
        _client = client;

  final Dio _client;
  final String _url;

  /// Retorna a lista de vagas.
  ///
  /// Preenchida com as vagas mais recentes
  /// ou vazia se ocorreu algum erro.
  @override
  Future<List<Job>> getJobs() async {
    final jobs = <Job>[];

    try {
      final response = await _client.get<String>(_url);

      if (response.statusCode == 200) {
        final document = parse(response.data);

        final articles = document.getElementsByTagName('article');

        for (final article in articles) {
          final job = _parseJob(article);
          if (job != null) jobs.add(job);
        }
      }

      return jobs;
    } on Exception catch (error) {
      dev.log('Error fetching jobs: $error');
    }

    return jobs;
  }

  @override
  Future<String> getJobDetail(String url) async {
    final response = await _client.get<String>(url);
    final document = parse(response.data);

    return document.getElementsByClassName('job-desc').first.innerHtml;
  }

  Job? _parseJob(Element article) {
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
        description: '',
        date: date,
        url: url,
      );
    } on Exception catch (_) {
      return null;
    }
  }
}
