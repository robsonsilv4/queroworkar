import 'package:flutter/material.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:share/share.dart';

class JobShare extends StatelessWidget {
  final Job job;

  JobShare({@required this.job});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        Icons.share,
        size: 16,
      ),
      onTap: () {
        return _share(
          context: context,
          url: job.url,
        );
      },
    );
  }

  _share({BuildContext context, String url}) {
    final RenderBox box = context.findRenderObject();

    Share.share(
      url,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
