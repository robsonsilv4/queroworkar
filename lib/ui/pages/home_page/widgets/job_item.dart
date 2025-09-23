import 'package:flutter/material.dart';

import '../../../../data/models/job_model.dart';
import '../../../../shared/constants/images.dart';
import '../../../../shared/constants/qw_theme.dart';
import '../../../../shared/widgets/job_share.dart';
import '../../detail_page.dart';

class JobItem extends StatelessWidget {
  final Job job;

  const JobItem({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: job.image.isNotEmpty
                        ? NetworkImage(job.image)
                        : AssetImage(Images.company_logo) as ImageProvider,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              job.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: QWTheme.title,
                              ),
                            ),
                            SizedBox(height: 1.0),
                            Text(
                              job.date,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                'Ver mais...',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => _toDetail(
                                context: context,
                                job: job,
                              ),
                            ),
                            Spacer(),
                            JobShare(
                              job: job,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onDoubleTap: () => _toDetail(
        job: job,
        context: context,
      ),
      onLongPress: () => _toDetail(
        job: job,
        context: context,
      ),
    );
  }

  _toDetail({required Job job, required BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(
            jobTitle: job.title,
            jobUrl: job.url,
          );
        },
      ),
    );
  }
}
