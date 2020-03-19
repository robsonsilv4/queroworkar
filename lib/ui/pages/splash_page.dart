import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../blocs/jobs/jobs_bloc.dart';
import '../../blocs/jobs/jobs_event.dart';
import '../../data/repositoires/job_repository.dart';
import '../../di/service_locator.dart';
import '../../shared/constants/images.dart';
import 'home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => JobsBloc(
              jobsRepository: sl.get<JobsRepository>(),
            )..add(LoadJobs()),
            child: HomePage(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInImage(
                fadeOutDuration: Duration(milliseconds: 100),
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(Images.logo),
                height: 60.0,
              ),
              SizedBox(height: 4.0),
              FadeInImage(
                fadeOutDuration: Duration(milliseconds: 300),
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(Images.branding),
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
