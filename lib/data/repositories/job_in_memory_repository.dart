import 'package:quero_workar/data/models/job_model.dart';
import 'package:quero_workar/data/repositories/repositories.dart';

// Company, location, etc can be added later if needed
class JobInMemoryRepository implements JobRepository {
  JobInMemoryRepository();

  final List<Job> _jobs = [
    Job(
      title: 'Desenvolvedor Flutter',
      url: 'https://techsolutions.com/jobs/flutter',
      description:
          'Desenvolva aplicativos móveis usando Flutter em um time ágil.',
      image: 'https://picsum.photos/150?random=1',
      date: DateTime(2025, 3, 14, 10, 23),
    ),
    Job(
      title: 'Backend Developer',
      url: 'https://datacorp.com/jobs/backend',
      description:
          'Responsável pelo desenvolvimento e manutenção de APIs RESTful.',
      image: 'https://picsum.photos/150?random=2',
      date: DateTime(2025, 7, 2, 8, 5),
    ),
    Job(
      title: 'UI/UX Designer',
      url: 'https://designpro.com/jobs/uiux',
      description:
          'Crie interfaces intuitivas e experiências incríveis para usuários.',
      image: 'https://picsum.photos/150?random=3',
      date: DateTime(2024, 12, 27, 18, 45),
    ),
  ];

  @override
  Future<List<Job>> getJobs() async {
    return _jobs;
  }

  @override
  Future<String> getJobDetail(String url) async {
    final job = _jobs.firstWhere(
      (job) => job.url == url,
      orElse: () => Job.empty,
    );
    return job.description;
  }
}
