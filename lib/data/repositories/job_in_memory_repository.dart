import 'package:quero_workar/data/models/models.dart';
import 'package:quero_workar/data/repositories/repositories.dart';
import 'package:uuid/uuid.dart';

class JobInMemoryRepository implements JobRepository {
  JobInMemoryRepository();

  late final _uuid = const Uuid();
  late final _jobs = <Job>[
    Job(
      id: _uuid.v4(),
      url: '',
      company: Company(
        id: _uuid.v4(),
        name: 'Empresa Exemplo',
        category: 'Outros',
        location: 'Quixadá, CE',
        imageUrl: 'https://picsum.photos/150?random=1',
      ),
      title: 'Desenvolvedor Flutter',
      description:
          'Desenvolva aplicativos móveis usando Flutter em um time ágil.',
      date: DateTime(2025, 3, 14, 10, 23),
    ),
    Job(
      id: _uuid.v4(),
      url: '',
      company: Company(
        id: _uuid.v4(),
        name: 'Tech Solutions',
        category: 'Outros',
        location: 'Pacoti, CE',
        imageUrl: 'https://picsum.photos/150?random=2',
      ),
      title: 'Backend Developer',
      description:
          'Responsável pelo desenvolvimento e manutenção de APIs RESTful.',
      date: DateTime(2025, 7, 2, 8, 5),
    ),
    Job(
      id: _uuid.v4(),
      url: '',
      company: Company(
        id: _uuid.v4(),
        name: 'Design Studio',
        category: 'Outros',
        location: 'Fortaleza, CE',
        imageUrl: 'https://picsum.photos/150?random=3',
      ),
      title: 'UI/UX Designer',
      description:
          'Crie interfaces intuitivas e experiências incríveis para usuários.',
      date: DateTime(2024, 12, 27, 18, 45),
    ),
  ];

  @override
  Future<List<Job>> getJobs() async {
    return _jobs;
  }

  @override
  Future<String> getJobDetail(String id) async {
    final job = _jobs.firstWhere(
      (job) => job.id == id,
      orElse: () => Job.empty,
    );
    return job.description;
  }
}
