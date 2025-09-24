import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_workar/blocs/jobs/jobs_bloc.dart';
import 'package:quero_workar/blocs/jobs/jobs_event.dart';
import 'package:quero_workar/data/repositories/job_repository.dart';
import 'package:quero_workar/di/service_locator.dart';
import 'package:quero_workar/shared/constants/images.dart';
import 'package:quero_workar/ui/pages/home_page/home_page.dart';
import 'package:transparent_image/transparent_image.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return null;
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (context) => BlocProvider(
              create: (context) => JobsBloc(
                jobsRepository: sl.get<JobsRepository>(),
              )..add(LoadJobs()),
              child: const HomePage(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInImage(
                fadeOutDuration: const Duration(milliseconds: 100),
                placeholder: MemoryImage(kTransparentImage),
                image: const AssetImage(Images.logo),
                height: 60,
              ),
              const SizedBox(height: 4),
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: const AssetImage(Images.branding),
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
